def isClassCancelled?(number_of_students,students_time_arr,min_students_reqd)
	students_arrived_before_time=0
	std_effective_attendance_arr=Array.new(number_of_students,0)
	(0...students_time_arr.length).each do |i|
		(0...students_time_arr[i].length).each do |j|
			if (students_time_arr[i][j] > 0)
				std_effective_attendance_arr[j]+=1
			end
		end
	end
	students_eligible_for_this_class=0
	std_effective_attendance_arr.each do |attendance|
		if attendance <= 3
			students_eligible_for_this_class+=1
		end
	end
	return students_eligible_for_this_class < min_students_reqd ?true:false
end

n=gets.chomp.to_i
t=gets.chomp.to_i
k=gets.chomp.to_i
out_str=""
enter_time_arr=Array.new
t.times do
	enter_time_arr<<gets.chomp.split(" ").map(&:to_i)
	out_str+= isClassCancelled?(n,enter_time_arr,k)?"YES\n":"NO\n"
end

print out_str

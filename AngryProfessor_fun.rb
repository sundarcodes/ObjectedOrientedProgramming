def isClassCancelled?(students_time_arr,min_students_reqd)
	students_arrived_before_time=0
	students_time_arr.each {|element|
		if (element <= 0)
			students_arrived_before_time+=1
		end
	}
	return students_arrived_before_time < min_students_reqd ?true:false
end

t=gets.chomp.to_i
out_str=""
t.times do
	n,k=gets.chomp.split(" ").map(&:to_i)
	enter_time_arr=gets.chomp.split(" ").map(&:to_i)
	out_str+= isClassCancelled?(enter_time_arr,k)?"YES\n":"NO\n"
end

print out_str
class Student
	def initialize()
		@entry_time=Array.new
		@is_Missing_Class=false
		@num_late_instances=0
	end
	def addEntryTime(entry_time)
		@entry_time<<entry_time
		if entry_time>0
			@num_late_instances+=1
			if @num_late_instances>3
				@is_Missing_Class=true
			end
		end
	end
	def isStudentEligible?()
		return !@is_Missing_Class
	end
	def resetAttendance()
		@is_Missing_Class=false
		@num_late_instances=0
	end
end

class AP_Class
	def initialize(min_num_students_reqd,students_objs)
		@min_num_students_reqd=min_num_students_reqd
		@students_objs=students_objs
	end
	def isClassCancelled?()
		students_arrived_before_time=0
		@students_objs.each {|student|
			if (student.isStudentEligible?())
				students_arrived_before_time+=1
			else
				student.resetAttendance()
			end
   	}
		return students_arrived_before_time < @min_num_students_reqd ?true:false
	end
end

#N will be number of students

n=gets.chomp.to_i
students_objs_arr=Array.new
#Create the student objects and put into a Students Array
n.times do
	objStudent=Student.new
	students_objs_arr<<objStudent
end

t=gets.chomp.to_i
# k is the minimum numer of students required for a class to go on
k=gets.chomp.to_i
out_str=""
t.times do
	students_entry_times=gets.chomp.split(" ").map(&:to_i)
	i=0
	students_entry_times.each do |time|
		students_objs_arr[i].addEntryTime(time)
		i+=1
	end
	obj_Class=AP_Class.new(k,students_objs_arr)
	out_str+= obj_Class.isClassCancelled?()?"YES\n":"NO\n"
end

print out_str

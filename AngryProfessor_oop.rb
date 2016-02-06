class Student
	attr_accessor :entry_time
	def initialize()
		@entry_time=nil
		@late_entry_counter=0
	end
	def addEntryTime(time)
		if time>0
			@late_entry_counter+=1
		end
	end
	def isBarred?
		return @late_entry_counter>3?true:false
	end
	def allow_Student
		@late_entry_counter=0
	end
end

class AP_Class
	def initialize(min_num_students_reqd,students_entry_times)
		@min_num_students_reqd=min_num_students_reqd
		@students_entry_times=students_entry_times
	end
	def isClassCancelled?()
		students_arrived_before_time=0
		@students_entry_times.each {|student|
			if (!student.isBarred?)
				students_arrived_before_time+=1
			end
		}
		return students_arrived_before_time < @min_num_students_reqd ?true:false
	end
end

num_students=gets.chomp.to_i
num_lecture=gets.chomp.to_i
min_num_students_reqd=gets.chomp.to_i

students_objs_arr=Array.new()
num_students.times do {
  objStudent=Student.new
	students_objs_arr<<objStudent
}

num_lecture.times do{
	students_entry_times=gets.chomp.split(" ").map(&:to_i)
	i=0
	num_students.times do{
		students_objs_arr[i].addEntryTime(students_entry_times[i])
		i+=1
	}
	obj_Class=AP_Class.new(min_num_students_reqd,students_objs_arr)
	out_str+= obj_Class.isClassCancelled?()?"YES\n":"NO\n"
}

t=gets.chomp.to_i
out_str=""
t.times do
	n,k=gets.chomp.split(" ").map(&:to_i)
	students_entry_times=gets.chomp.split(" ").map(&:to_i)
	students_objs_arr=Array.new()
	students_entry_times.each do |time|
		objStudent=Student.new
		objStudent.entry_time=time
		students_objs_arr<<objStudent
	end
	obj_Class=AP_Class.new(k,students_objs_arr)
	out_str+= obj_Class.isClassCancelled?()?"YES\n":"NO\n"
end

print out_str

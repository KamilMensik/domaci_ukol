
users = User.create([
{first_name: 'Kamil',surname:"Mensik",email:"kamilekmensik@gmail.com",password:"Kamilek1"},
{first_name: 'Kamil',surname:"Mensik",email:"kamilekmensik2@gmail.com",password:"Kamilek1"},
{first_name: 'Kamil',surname:"Mensik",email:"kamilekmensik3@gmail.com",password:"Kamilek1"}])

users.each do |user|
	5.times do |n|
		Tag.create(title:"Tag#{n}",user_id:user.id)
		Task.create(title:"Task#{n}",user_id:user.id,description:"popisek",is_done:false,file:nil)
		Project.create(title:"Project#{n}",user_id:user.id,position:n)
	end
end

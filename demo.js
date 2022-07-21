function saveData() {

    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const mobile = document.getElementById('mobile').value;
    const gender = document.getElementById('gender').value;
    const age = document.getElementById('age').value;
    const address=document.getElementById('address').value;
    const religion = document.getElementById('religion').value;
    const password = document.getElementById('password').value; 
    // var lowerCaseLetters = /[a-z]/g;
    // var upperCaseLetters = /[A-Z]/g;
    var name_val = /^[A-Za-z]+$/;
    //var numbers = /[0-9]/g;
    var email_val = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,10})+$/;
    var num_val = /^[0-9]+$/;
    var phone_value = /^[7-9]\d{9}$/;
    var pass_value=/^[a-zA-Z0-9]+$/;

    if (name == '' || gender == '' || age == '' || email == '' || mobile == ''|| address==''|| password == '' || religion == '') {
        alert('pleae fill all field properly!')
    }
    else if (!name_val.test(name)) {
        alert('please fill valid name')
    } else if (!email_val.test(email)) {
        alert('please fill valid email')
    } else if (!num_val.test(age)) {
        alert('please fill valid age ');
    } else if (!phone_value.test(mobile)) {
        alert('please fill valid phone no')
    } else if (!name_val.test(gender)) {
        alert('please fill valid gender')
    } else if (!name_val.test(address)) {
        alert('please fill valid address')
    } else if (!name_val.test(religion)) {
        alert('please fill valid religion')
    }else if(!pass_value.test(password)){
        alert('please fill valid password')
    }else { 
        let user_records = new Array();
        user_records = JSON.parse(localStorage.getItem("users")) ? JSON.parse(localStorage.getItem("users")) : []
        console.log(user_records);
        if (user_records.some((v) => { return v.email == email})) {
            alert("duplicate data");
        }else {
            user_records.push({
                "name": name,
                "email": email,
                "password": password,
                "mobile": mobile,
                "gender": gender,
                "age": age,
                "religion": religion
            })
           
            localStorage.setItem("users", JSON.stringify(user_records))
            
            alert('data inserted successfully!');
            showData();
            window.location.href="home.html" 
               
            
        }
        
    }

}



function loginData()
{
 
var email=document.getElementById("email").value;
console.log(email);
var mobile=document.getElementById("email").value

var password=document.getElementById("password").value;
console.log(password)

let user_records=new Array();
user_records=JSON.parse(localStorage.getItem("users"))?JSON.parse(localStorage.getItem("users")):[]
if(user_records.some((v)=>{return v.email==email && v.password==password}))
{
  alert("Login Pass");
  let current_user=user_records.filter((v)=>{return v.email==email && v.password==password})[0]
 localStorage.setItem('name',current_user.name);
 localStorage.setItem('email',current_user.email);
 window.location.href="profile.html" 
}
else
{
  alert('Login Fail');
  window.location.href="home.html"
}
}

function Logout() {
    localStorage.removeItem('name');
    localStorage.removeItem('email');
    window.location.href = "login.html";
}

function showData()
{
  document.getElementById("showUsers").innerHTML="";
  let user_records=new Array();
user_records=JSON.parse(localStorage.getItem("users"))?JSON.parse(localStorage.getItem("users")):[]
  if(user_records)
  {
    for(let i=0;i<user_records.length;i++)
    {
      let addDiv=document.createElement('div');
  addDiv.className="row";
  addDiv.innerHTML='  <div class="col-sm-4" style="padding: 10px;">'+user_records[i].name+'</div><div class="col-sm-4" style="padding: 10px;">'+user_records[i].email+'</div><div class="col-sm-4" style="padding: 10px;">'+user_records[i].psw+'</div>';
  document.getElementById("showUsers").appendChild(addDiv);

    }
  }
  }
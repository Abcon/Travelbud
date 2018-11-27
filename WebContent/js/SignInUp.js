var check = function() {
  if (document.getElementById('s_password').value ==
    document.getElementById('s_cpassword').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'Password matched';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'Password did not match. Please try again carefully!!!';
  }
}
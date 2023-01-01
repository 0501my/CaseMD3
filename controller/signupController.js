const qs = require('qs');
const fs = require('fs')
const userModel = require('../model/userModel')
class SignupController{
static signUp(req, res) {
    if (req.method === 'GET') {
        fs.readFile('../view/login/signup.html', 'utf-8', async (err, signUpHtml) => {
            if (err) {
                console.log(err)
            } else {
                res.writeHead(200, 'text/html');
                res.write(signUpHtml);
                res.end();
            }
        })
    } else {
        let data = '';
        req.on('data', chuck => {
            data += chuck;
        })
        req.on('end', async (err) => {
            if (err) {
                console.log(err)
            } else {
                let user = qs.parse(data);
                await userModel.signUp(user);
                res.writeHead(301, {'location': '/login'})
                res.end();
            }
        })
    }
}
}
module.exports = SignupController;

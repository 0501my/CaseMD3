const qs = require('qs');
const fs = require('fs')
const userModel = require('../model/userModel')
const BaseController = require('./baseController')

class SignupController extends BaseController {
    static view = async (req, res) => {
        if (req.method === 'GET') {
            let data = await this.readFile('./view/login/signup.html', 'utf-8')
            res.writeHead(200, 'text/html');
            res.write(data);
            res.end();
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

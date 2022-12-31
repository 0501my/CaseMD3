const http = require('http');
const url = require('url');
const Router = require('./controller/router.js');
const BaseController = require('./controller/baseController.js');
const db = require('./model/database.js');

db.connect;

const server = http.createServer( async (req, res) => {
  let parseUrl = url.parse(req.url, true);
  let path = parseUrl.pathname;
  let trimPath = path.replace(/^\/+|\/$/g, '');
  let sessionAvailable = await BaseController.checkSession(req);

  let loginRequest = ['login', 'login/submit', 'login/fail'];
  let tryLogIn = loginRequest.indexOf(trimPath) !== -1;

  if (sessionAvailable || tryLogIn) {
    let {controller, action} = BaseController.parsePath(trimPath);
    let handler = Router[controller][action] ? Router[controller][action] : Router.notFound;
    console.log(BaseController.parsePath(trimPath));
    handler(req,res);
  } else {
    await Router.login.view(req, res);
  }
});

;
server.listen(3000, function () {
  console.log(`server running at http://localhost:3000/home`);
});

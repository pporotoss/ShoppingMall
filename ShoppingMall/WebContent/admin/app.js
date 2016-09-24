/*create database u4biuse u4bi
 create table shop_table(
 shop_id int not null auto_increment primary key,
 name varchar(50) not null,
 price int(10) not null,
 nation varchar(50) not null
 );
 shop_id name price nation
 */
var fs= require('fs');
var ejs = require('ejs');
var http = require('http');
var mysql = require('mysql');
var express = require('express');

//디비연결
var client = mysql.createConnection({
	user: 'root',
	password: 'root1595321',
	database: 'u4bi'
});
//서버생성
var app = express();
app.use(express.cookieParser());
app.use(express.bodyParser());
app.use(app.router);

//서버실행
http.createServer(app).listen(8888, function(){
	console.log('서버열 8888포트');
});

//라우터 연결

app.get('/', function (request, response) {
	if(request.cookies.auth){
		response.redirect('/list');
	}else{
		response.redirect('/login');
	}
});

app.get('/login', function (request, response) {
	fs.readFile('index.html', function (error, data){
		response.send(data.toString());
	});
});

app.post('/login', function (request, response) {
	var login = request.param('login');
	var password = request.param('password');

	//유효성
	if(login == 'admin' && password == '1234'){
		//쿠키대입
		response.cookie('auth', true);
		response.redirect('/');
	}else{
		response.redirect('/login');
	}
});

app.get('/list', function(request, response){
	fs.readFile('list.html','utf8', function(error, data){
		client.query('SELECT * FROM shop_table',function (error, results){
			response.send(ejs.render(data, {
				data:results
			}));
		});
	});
});

app.get('/delete/:id', function(request, response){
	client.query('DELETE FROM shop_table WHERE shop_id=?',[request.param('id')],function(){
		response.redirect('/');
	});
});

app.get('/insert', function(request, response){
	fs.readFile('insert.html','utf8', function (error, data){
		response.send(data);
	});
});

app.post('/insert', function(request, response){
	var body=request.body;
	client.query('INSERT INTO shop_table (name, price, nation)VALUES(?,?,?)',[body.name,body.price,body.nation],function(){
		response.redirect('/');
	});
});

app.get('/edit/:id', function(request, response){
	fs.readFile('edit.html','utf8', function(error,data){
		client.query('SELECT * FROM shop_table WHERE shop_id=?', [request.param('id')], function (error, result){
			response.send(ejs.render(data, {
				data:result[0]
			}));
		});
	});
});

app.post('/edit/:id', function(request, response){
	var body = request.body;
	client.query('UPDATE shop_table SET name=?, price=?, nation=? WHERE shop_id=?',
		[body.name, body.price, body.nation, request.param('id')],function(){
	});
	response.redirect('/');
});
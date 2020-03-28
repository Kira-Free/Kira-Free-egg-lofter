'use strict';
const Controller = require('egg').Controller;
let captchaSession,
  phoneSession,
  str;

class HomeController extends Controller {
  async getNewsList() {
    const { ctx, app } = this;
    const index = ctx.query.index;
    const sqlStr = `select * from news limit ${index - 1}, ${index}`;
    const result = await app.mysql.query(sqlStr);
    if (!result[0]) {
      ctx.body = { error_code: 0, message: '已无更多' };
      return;
    }
    ctx.body = { success_code: 200, message: result };
  }

  async getCaptcha() {
    const { ctx } = this;
    const svgCaptcha = require('svg-captcha');
    const captcha = svgCaptcha.create({
      color: true,
      noise: 2,
      ignoreChars: '0oi1',
      size: 4,
    });
    // console.log(captcha.text);
    // 保存验证码
    ctx.session.captcha = captcha.text.toLowerCase();
    captchaSession = ctx.session.captcha;
    console.log(ctx.session.captcha);
    ctx.response.type = 'image/svg+xml'; // 知道你个返回的类型
    ctx.session.maxAge = 1000 * 60;
    ctx.body = captcha.data;
  }

  async Login() {
    const { ctx, app } = this;
    const username = ctx.request.body.phone;
    const password = ctx.request.body.pass;
    const captcha = ctx.request.body.captcha.toLowerCase();
    console.log(captcha);
    if (captcha !== captchaSession) {
      ctx.body = { success_code: 0, message: '验证码错误' };
      captchaSession = null;
      return;
    }
    const result = await app.mysql.query(`select * from user where phone=${username}`);
    if (!result[0]) {
      ctx.body = { success_code: 0, message: '查无此数据' };
      return;
    }
    if (password !== result[0].password) {
      ctx.body = { success_code: 0, message: '密码错误' };
      return;
    }
    ctx.body = { success_code: 200, message: result };
  }

  async captchaContrast() {
    const { ctx } = this;
    const captcha = ctx.request.body.captcha.toLowerCase();
    if (captcha !== captchaSession) {
      console.log(captcha);
      console.log('1');
      ctx.body = { success_code: 0, message: '验证码错误' };
      return;
    }
    phoneSession = ctx.request.body.phone;
    str = '';
    for (let i = 0; i < 4; i++) {
      str += Math.floor(Math.random() * 10);
    }
    ctx.body = { success_code: 200, message: str };
  }

  async Register() {
    const { ctx, app } = this;
    const phone = ctx.request.body.phone;
    const pass = ctx.request.body.pass;
    if (phoneSession !== phone) {
      ctx.body = { success_code: 0, message: '手机号改动' };
      phoneSession = null;
      return;
    }
    if (pass !== str) {
      ctx.body = { success_code: 0, message: '密码填写错误' };
      str = null;
      return;
    }
    let sqlStr = `select * from user where phone= ${phone}`;
    let result = await app.mysql.query(sqlStr);
    if (result[0]) {
      ctx.body = { success_code: 0, message: '该手机号已注册' };
      return;
    }
    sqlStr = `INSERT INTO user (phone, password) VALUES (${phone},${123456})`;
    result = await app.mysql.query(sqlStr);
    sqlStr = `select * from user where phone=${phone} limit 1`;
    result = await app.mysql.query(sqlStr);
    if (!result[0]) {
      ctx.body = { success_code: 0, message: '注册失败' };
      return;
    }
    ctx.body = { success_code: 200, message: result };
  }

}

module.exports = HomeController;

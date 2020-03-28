'use strict';
const Controller = require('egg').Controller;

class HomeController extends Controller {
  async getAttentionAuthorList() {
    const { ctx, app } = this;
    const sqlStr = `select * from author where attention = ${1}`;
    const result = await app.mysql.query(sqlStr);
    ctx.body = { success_code: 200, message: result };
  }

  async cancelAttention() {
    const { ctx, app } = this;
    const id = ctx.request.body.id;
    const sqlStr = `UPDATE author SET attention = '0' WHERE (id = ${id})`;
    const result = await app.mysql.query(sqlStr);
    console.log(result);
    ctx.body = { success_code: 200, message: result };
  }
}
module.exports = HomeController;

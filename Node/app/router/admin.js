'use strict';
module.exports = app => {
  const { router, controller } = app;
  router.get('/axios/getAuthorList', controller.admin.home.getAttentionAuthorList);
  router.post('/axios/cancelAttention', controller.admin.home.cancelAttention);
};

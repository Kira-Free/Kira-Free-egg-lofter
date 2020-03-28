'use strict';

module.exports = app => {
  const { router, controller } = app;
  router.get('/axios/news', controller.default.home.getNewsList);
  router.get('/axios/captcha', controller.default.home.getCaptcha);
  router.post('/axios/user', controller.default.home.Login);
  router.post('/axios/contrast', controller.default.home.captchaContrast);
  router.post('/axios/register', controller.default.home.Register);
};

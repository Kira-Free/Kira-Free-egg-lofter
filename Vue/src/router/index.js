import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    redirect: '/home'
  },
  {
    path: '/home',
    component: Home,
    redirect: '/home/attention',
    children: [
      { path: 'attention', component: () => import('../views/home/Attention.vue'), meta: { showBottomTabBar: true } },
      { path: 'subscribe', component: () => import('../views/home/Subscribe.vue'), meta: { showBottomTabBar: true } }
    ]
  },
  {
    path: '/home/add',
    component: () => import('../views/home/Add.vue'),
    redirect: '/home/add/recommended',
    children: [
      { path: 'recommended', component: () => import('../views/home/add/Recommended.vue'), meta: { showBottomTabBar: true } },
      { path: 'guess', component: () => import('../views/home/add/Guess.vue'), meta: { showBottomTabBar: true } },
      { path: 'popular', component: () => import('../views/home/add/Popular.vue'), meta: { showBottomTabBar: true } }
    ]
  },
  {
    path: '/found',
    component: () => import('../views/Found.vue'),
    meta: { showBottomTabBar: true },
    redirect: '/found/recommended',
    children: [
      { path: 'recommended', component: () => import('./../views/found/Recommended.vue'), meta: { showBottomTabBar: true } },
      { path: 'video', component: () => import('../views/found/Video.vue'), meta: { showBottomTabBar: true } },
      { path: 'entertainment', component: () => import('../views/found/Entertainment.vue'), meta: { showBottomTabBar: true } }
    ]
  },
  {
    path: '/release',
    component: () => import('../views/Release.vue'),
    meta: { showBottomTabBar: true }
  },
  {
    path: '/fair',
    component: () => import('../views/Fair.vue'),
    meta: { showBottomTabBar: true }
  },
  {
    path: '/personal',
    component: () => import('../views/Personal.vue'),
    meta: { showBottomTabBar: true }
  },
  {
    path: '/personal/login',
    component: () => import('../views/personal/Login.vue')
  },
  {
    path: '/personal/register',
    component: () => import('../views/personal/Register.vue')
  },
  { path: '/personal/attention', component: () => import('./../views/personal/children/Attention') },
  { path: '/personal/fan', component: () => import('./../views/personal/children/Attention') },
  { path: '/personal/recommend', component: () => import('./../views/personal/children/Attention') },
  {
    path: '*',
    redirect: '/home'
  }
]
const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
  linkActiveClass: 'on-activity'
})

export default router

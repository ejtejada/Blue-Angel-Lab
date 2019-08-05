import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '../views/layout/Layout'

/**
* hidden: true                   if `hidden:true` will not show in the sidebar(default is false)
* alwaysShow: true               if set true, will always show the root menu, whatever its child routes length
*                                if not set alwaysShow, only more than one route under the children
*                                it will becomes nested mode, otherwise not show the root menu
* redirect: noredirect           if `redirect:noredirect` will no redirect in the breadcrumb
* name:'router-name'             the name is used by <keep-alive> (must set!!!)
* meta : {
    title: 'title'               the name show in subMenu and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar
    breadcrumb: false            if false, the item will hidden in breadcrumb(default is true)
  }
**/
export const constantRouterMap = [
  { path: '/login', component: () => import('@/views/login/index'), hidden: true },
  { path: '/404', component: () => import('@/views/404'), hidden: true },
  // { path: '/casino', component: () => import('@/views/casino') },

  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    name: 'Dashboard',
    hidden: true,
    children: [{
      path: 'dashboard',
      component: () => import('@/views/dashboard/index')
    }]
  },
  {
    path: '/dapp',
    component: Layout,
    children: [
      {
        path: 'index',
        name: 'Dapp',
        component: () => import('@/views/dapp'),
        meta: { title: 'dapp', icon: 'link' }
      }
    ]
  },
  {
    path: '/service',
    component: Layout,
    children: [
      {
        path: 'index',
        name: 'Form',
        component: () => import('@/views/form/index'),
        meta: { title: '服务提供者', icon: 'form' }
      }
    ]
  },
  {
    path: '/evaluate',
    component: Layout,
    children: [
      {
        path: 'index',
        name: 'Evaluate',
        component: () => import('@/views/evaluate'),
        meta: { title: '评价者', icon: 'table' }
      }
    ]
  },
  {
    path: '/donate',
    component: Layout,
    children: [
      {
        path: 'index',
        name: 'Donate',
        component: () => import('@/views/donate'),
        meta: { title: '捐助者', icon: 'user' }
      }
    ]
  },

  { path: '*', redirect: '/404', hidden: true }
]

export default new Router({
  // mode: 'history', //后端支持可开
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRouterMap
})

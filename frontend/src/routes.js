export const routes = [
    {
        path:'/',
        redirect: '/home',

    },
    {
        path:'/home/main',
        name:'home2',
        component: () => import('./components/Home'),
        children: [
            {
                path:'/home',
                name:'home',
                component: () => import('./components/homepage'),
            },
            {
                path:'/customer',
                component: () => import('./components/Customer/Customer.vue'),
            },
            {
                path:'/register',
                component: () => import('./components/bform.vue'),
            },
            {
                path:'/about',
                component: () => import('./components/IndexPage.vue'),
            },
            {
                path:'/service',
                component: () => import('./components/list.vue'),
            },
            {
                path:'/filter',
                component: () => import('./components/filter_effect.vue'),
            },
            {
                path:'/client-mixin',
                component: () => import('./components/client.vue'),
            },
            {
                path:'/blog',
                component: () => import('./components/blog.vue'),
            },
            {
                path:'/chat',
                component: () => import('./components/internal/Customer/chat/chatRoom'),
            },
            {
                path:'/chat/room/:id',
                name:'chat',
                component: () => import('./components/internal/Customer/chat/chatIndex'),
            },

        ]
    },
    {
        path:'/login',
        name:'login',
        component: () => import('./components/internal/login/loginform.vue'),
    },
    {
        path:'/login/dashboard',
        name:'login_dashboard',
        meta: { appbar_close: true },
        component: () => import('./components/internal/loginDashboard'),
        children: [
            {
                path:'/login/post',
                name:'login_post',
                component: () => import('./components/internal/Admin/blogPost/index.vue'),
            },
            {
                path:'/login/current-user-dashboard',
                name:'current_user_dashboard',
                component: () => import('./components/internal/Admin/Dashboard/index'),
            },
            {
                path:'/admin/post-create',
                name:'post_create',
                component: () => import('./components/internal/Admin/blogPost/blogCreate'),
            },
            {
                path:'/chat/customer',
                name:'chat_customer',
                component: () => import('./components/internal/Admin/Chat/chatIndex'),
            },
            {
                path:'/chat/room/admin/:id',
                name:'chat_admin',
                component: () => import('./components/internal/Admin/Chat/chatRoomAdmin'),
            }

        ]
    },
    {
        path:'/customer/dashboard',
        name:'customer_dashboard',
        component: () => import('./components/internal/Customer/Dashboard/index.vue'),
    },
    {
        path:'/Admin/sidebar',
        name:'admin_sidebar',
        component: () => import('./components/internal/layout/sidebar/AdminSidebar.vue'),

    },
    {
        path:'/test',
        name:'test',
        component: () => import('./components/internal/Admin/blogPost/index.vue'),

    }


];

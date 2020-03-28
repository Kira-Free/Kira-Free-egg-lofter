<template>
    <div class="bottom-tab">
        <router-link tag="li" to="/home" class="tab-item">
            <van-icon name="wap-home" />
            <span class="on">首页</span>
        </router-link>
        <router-link tag="li" to="/found" class="tab-item">
            <van-icon name="fire" />
            <span>发现</span>
        </router-link>
        <router-link tag="li" to="/release" class="tab-item">
            <van-icon class="add" name="add" />
        </router-link>
        <router-link tag="li" to="/fair" class="tab-item">
            <van-icon name="cart" />
            <span>市集</span>
        </router-link>
        <router-link tag="li" to="/personal" class="tab-item">
            <van-icon name="manager" />
            <span>我的</span>
        </router-link>
    </div>
</template>
<script>
export default {

}
</script>
<style lang="scss">
    .bottom-tab{
        width: 100%;
        height: 50px;
        background-color: #fff;
        position: fixed;
        left:0;
        bottom: 0;
        display: flex;
        z-index: 999;
        box-shadow: 0px -5px 5px -5px rgb(194, 193, 193);
    }
    .tab-item{
        color: rgba(87, 85, 85,0.6);
        display: flex;
        flex: 1;
        flex-direction: column;
        align-items: center;
        justify-content:center;
        font-size: 14px;
        i{
            font-size: 26px;
        }
        .add{
            font-size: 40px;
        }
        span{
            font-size: 10px;
        }
    }
    .on-activity   {
        color: rgba(0, 0, 0,0.8);
    }
</style>

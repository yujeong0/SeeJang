`
<template>
    <div id="container">
        <div style="text-align: left" class="pl-4 my-1 target ml-3 mr-3">
            <a target="_blank" :href="like.link"> {{ like.siteName }}</a> :
            {{ like.productName }}
            <div class="productPrice" style="text-align: right">
                {{ like.price }}원
                <v-btn text outlined @click="del" style="margin-left: 7px; width: 3%"
                    >_
                    <vue-star style="margin-left: " animate="animated bounce" color="#F05654">
                        <i slot="icon" class="fas fa-trash-alt"></i>
                    </vue-star>
                </v-btn>
            </div>
        </div>
    </div>
</template>

<script>
import http from "@/util/http-common.js";
export default {
    props: {
        like: Object,
        index: Number,
    },
    created() {
    },
    methods: {
        async del() {
            let wishNo = this.like.wishNo;
            await http
                .delete("/wishList", {
                    params: {
                        wishNo: wishNo,
                    },
                    withCredentials: true,
                })
                .then((response) => {
                    this.$emit("del", wishNo);
                })
                .catch((error) => {
                    console.log(error);
                });
        },
    },
};
</script>

<style scoped>
.productPrice {
    color: blue;
}
.target {
    text-overflow: ellipsis;
    overflow: hidden;
    display: block;
    width: 92%;
    white-space: nowrap;
}
</style>
`

<template>
    <div id="container">
        <div style="border-radius: 40px 40px; width: 33%; height: 130px; float: left" class="ma-3">
            <img
                :src="require('@/assets/static/productImg/' + this.categoryItem.productNo + '.png')"
                alt="dd"
                width="134px"
                height="140px"
                style="border-radius: 40px 40px"
            />
            <v-btn @click="addShoppingList">쇼핑리스트 추가</v-btn>
        </div>
        <div
            style="width: 60%; height: 200px; border: 1px solid white; float: left"
            class="mt-3 pa-13"
        >
            <div>{{ categoryItem.productName }}</div>
            <div style="color: blue">{{ categoryItem.productPrice }}원</div>
        </div>
    </div>
</template>

<script>
import http from "@/util/http-common.js";
export default {
    name: "categoryinfo",
    props: {
        categoryItem: Object,
    },
    created() {
        console.log("인포페이지");
    },
    data() {
        return {
        };
    },
    methods: {
        addShoppingList() {
            let formData = new FormData();
            formData.append("checked", false);
            formData.append("memberId", this.$store.getters.getMemberId);
            formData.append("productName", this.categoryItem.productName);
            formData.append("productPrice", this.categoryItem.productPrice);
            http.post("/shoppingList", formData, {
                withCredentials: true,
            })
                .then((response) => {
                    console.log(response);
                })
                .catch((error) => {
                    console.log(error);
                });
        },
    },
    data() {
        return {
            //productName: this.$store.getters.getProductName,
            //   productPrice: this.$store.getters.getProductPrice,
        };
    },
};
</script>

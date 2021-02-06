<template>
    <div id="container">
        <v-row no-gutters class="px-5">
            <v-col class="product">
                <img
                    :src="require('@/assets/static/productImg/' + this.categoryItem.productNo + '.png')"
                    alt="dd"
                    width="134px"
                    height="140px"
                    style="border-radius: 40px 40px"
                />
            </v-col>
            <v-col>
                <v-row>
                    <br />
                </v-row>
                <v-row no-gutters>
                    <v-col>
                        <div class="pro_name" style="text-align: center">
                            <strong>{{ this.categoryItem.productName }}</strong>
                        </div>
                        <div style="text-align: center">
                            <strong>{{ this.categoryItem.productPrice }} 원</strong>
                        </div>
                    </v-col>
                </v-row>
                <v-row no-gutters>
                    <v-col>
                        <v-btn text outlined @click="addShoppingList">쇼핑리스트 추가 </v-btn>
                    </v-col>
                    <v-col style="margin-top: 5px">
                        <v-btn style="margin-left: 2%" text outlined @click="detail"
                            >상세 보기
                        </v-btn>
                    </v-col>
                </v-row>
            </v-col>
        </v-row>
        <hr style="margin: 2% 0px" />
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
        detail() {
            let productInfo = {
                productName: this.categoryItem.productName,
                productNo: this.categoryItem.productNo,
                productPrice: this.categoryItem.productPrice,
            };
            console.log("setproductInfo부른다");
            this.$store.commit("SET_PRODUCT_INFO", { productInfo });
            console.log("setproductInfo부른뒤");
            this.$router.push("/detailProduct");
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

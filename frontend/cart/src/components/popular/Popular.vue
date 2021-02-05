<template>
    <div id="container">
        <div style="margin-bottom: 2%; text-align: center">
            <strong>인기 {{ this.popular.ranking }}위!!</strong>
        </div>
        <v-row no-gutters class="px-5">
            <v-col class="product">
                <img
                    :src="require('@/assets/static/productImg/' + this.popular.productNo + '.png')"
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
                            <strong>{{ this.popular.productName }}</strong>
                        </div>
                        <div style="text-align: center">
                            <strong>{{ this.popular.productPrice }} 원</strong>
                        </div>
                    </v-col>
                </v-row>
                <v-row no-gutters>
                    <v-col>
                        <v-btn text outlined @click="addShoppingList">쇼핑리스트 추가 </v-btn>
                    </v-col>
                    <!-- <v-btn text outlined style="margin-left:7px; width:3%">
                        <vue-star animate="animated bounce" color="#F05654">
                            <i slot="icon" class="fas fa-shopping-basket"></i>
                        </vue-star>
                    </v-btn> -->
                    <v-col style="margin-top:5px">
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
import VueStar from "vue-star";
import http from "@/util/http-common.js";
export default {
    components: {
        VueStar,
    },
    props: {
        popular: Object,
    },
    methods: {
        addShoppingList() {
            let formData = new FormData();
            formData.append("checked", false);
            formData.append("memberId", this.$store.getters.getMemberId);
            formData.append("productName", this.popular.productName);
            formData.append("productPrice", parseInt(this.popular.productPrice));
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
          
        },
    },
};
</script>

<style scoped>
.product {
    text-align: center;
}

.image {
    border-radius: 8px;
    width: 90%;
}

.pro_name {
    margin-bottom: -2px;
}

p {
    text-align: left;
    padding-left: 8px;
    padding-right: 8px;
}
</style>

<template>
    <div id="app" class="columns mt-4">
        <categorize />
        <div class="column" v-if="state">
            <CategoryInfo
                v-for="item in this.items"
                :categoryItem="item"
                :key="item.productNo"
            ></CategoryInfo>
        </div>
        <div class="column" v-if="!state">
            <br />
            <h3 class="mb-5">이번 주 인기상품</h3>
            <hr />
            <br />
            <popular v-for="popular in populars" :popular="popular" :key="popular.productNo" />
        </div>
    </div>
</template>

<script>
import Popular from "@/components/popular/Popular.vue";
import Categorize from "@/components/popular/Categorize.vue";
import CategoryInfo from "@/components/popular/categoryInfo.vue";
import { mapGetters } from "vuex";
import http from "@/util/http-common.js";

export default {
    components: {
        Popular,
        Categorize,
        CategoryInfo,
    },
    created() {
        http.get("/bestproduct", {
            withCredentials: true,
        })
            .then((response) => {
                this.populars = response.data;
            })
            .catch((error) => {
                console.log(error);
            });
    },
    computed: {
        ...mapGetters({ items: "getCategorizeItems", state: "getCategorizeState" }),
    },
    data() {
        return {
            noCategorize: true,
            populars: [],
        };
    },
    methods: {},
};
</script>

<style></style>

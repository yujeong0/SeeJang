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
            <h3 class="mb-5">이번 주 인기상품</h3>
            <popular v-for="popular in populars" :popular="popular" :key="popular.id" />
        </div>
    </div>
</template>

<script>
import Popular from "@/components/popular/Popular.vue";
import Categorize from "@/components/popular/Categorize.vue";
import CategoryInfo from "@/components/popular/categoryInfo.vue";
import { mapGetters } from "vuex";

export default {
    components: {
        Popular,
        Categorize,
        CategoryInfo,
    },
    computed: {
        ...mapGetters({ items: "getCategorizeItems", state: "getCategorizeState" }),
    },
    data() {
        return {
            noCategorize: true,
            populars: [
                {
                    id: 1,
                    name: "바나나 정말 맛있는 바나나",
                    img: "https://semantic-ui.com/images/avatar2/large/matthew.png",
                    info: "100g 3000원",
                },
                {
                    id: 2,
                    name: "빵",
                    img: "https://semantic-ui.com/images/avatar2/large/matthew.png",
                    info: "200g 2600원",
                },
                {
                    id: 3,
                    name: "우유",
                    img: "https://semantic-ui.com/images/avatar2/large/matthew.png",
                    info: "1L 1800원",
                },
            ],
        };
    },
    methods: {},
};
</script>

<style></style>

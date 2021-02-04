<template>
    <div class="itemWrap" id="container">
        <v-container>
            <v-row no-gutters>
                <v-col>
                    <input type="checkbox" v-model="checked" :checked="checked" @click="check" />
                </v-col>
                <v-col style="text-align: center">
                    {{ productName }}
                </v-col>
                <v-col style="text-align: right"> ₩ {{ productPrice }} </v-col>
                <v-col style="text-align: right; width: 2%">
                    <v-btn text @click="del" depressed color="error"> del </v-btn></v-col
                >
            </v-row>
        </v-container>
    </div>
</template>

<script>
import http from "@/util/http-common.js";
export default {
    name: "item",
    props: {
        item: Object,
    },
    data() {
        return {
            checked: this.item.checked,
            productName: this.item.productName,
            productPrice: this.item.productPrice,
            shoppingListNo: this.item.shoppingListNo,
        };
    },
    created() {
        if (this.checked) {
            let money = parseInt(this.productPrice);
            this.$store.commit("ADD_TOTAL_MONEY", { money });
        }
    },
    methods: {
        check() {
            let money = parseInt(this.productPrice);
            if (!this.checked) {
                this.$store.commit("ADD_TOTAL_MONEY", { money });
            } else {
                this.$store.commit("DEL_ITEM", { money });
            }
        },
        del() {
            let money = parseInt(this.productPrice);
            http.delete("/shoppingList", {
                params: {
                    shoppingListNo: this.shoppingListNo,
                },
                withCredentials: true,
            })
                .then((response) => {
                    if (this.checked) {
                        this.$store.commit("DEL_ITEM", { money });
                    }
                    console.log(response);
                    this.$emit("del", this.shoppingListNo);
                })
                .catch((error) => {
                    console.log(error);
                });
        },
    },
};
</script>

<style scope>
.itemWrap {
    margin: 1% 10%;
    text-align: left;
}
</style>

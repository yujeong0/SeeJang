<template>
    <div id="container">
        <div class="titleLabel mb-30">My Shopping List</div>
        <hr class="SLHR" />
        <div class="itemArea">
            <item v-for="item in items" :item="item" :key="item.shoppingListNo" @del="del"></item>
        </div>
        <v-container class="totalpriceArea">
            <hr class="SLHR" />
            <v-row no-gutters>
                <v-col cols="2" sm></v-col>
                <v-col style="text-align: left" cols="4"> 예상 총 가격 </v-col>
                <v-col style="text-align: left"> ₩ {{ getTotalMoney }} </v-col>
            </v-row>
            <div style="text-align: left; margin-left: 9%; margin-top: 1%">
                <v-btn class="mr-10" text style="width: 35%" @click="addList">
                    <img src="@/assets/plus.png" alt="" width="3%" />
                    <label style="font-size: 0.9em">쇼핑리스트 추가</label></v-btn
                >
                <v-btn class="" text style="width: 35%" @click="confirm">
                    <img src="@/assets/check.png" alt="" width="11%" />
                    <label style="font-size: 0.9em">구매 완료!</label></v-btn
                >
            </div>
        </v-container>
    </div>
</template>

<script>
import item from "@/components/shopping/item.vue";
import http from "@/util/http-common.js";
import AddShoppingList from "@/components/shopping/AddShoppingListForm.vue";
import { mapGetters } from "vuex";

export default {
    name: "ShoppingList",
    created() {
        this.$store.commit("SET_ZERO_TOTAL");
        var member_id = sessionStorage.getItem("userId");
        http.get("/shoppingList", {
            params: {
                MemberId: member_id,
            },
            withCredentials: true,
        })
            .then((response) => {
                this.items = response.data;
            })
            .catch((error) => {
                console.log(error);
            });
    },
    computed: {
        ...mapGetters(["getTotalMoney", "getCheckedList"]),
    },
    components: {
        item,
    },
    data() {
        return {
            items: [],
        };
    },
    methods: {
        addList() {
            this.$modal.show(
                AddShoppingList,
                {
                    add: this.add,
                    addData: "data",
                    modal: this.$modal,
                },
                {
                    name: "AddShoppingList-modal",

                    width: "70%",
                    height: "60%",
                    draggable: false,
                    shiftY: 0.5,
                },
                {
                    closeByName() {
                        this.$modal.hide("AddShoppingList-modal");
                    },
                    closeByEvent() {
                        this.$emit("close");
                    },
                }
            );
        },
        add(item) {
            this.items.push(item);
        },
        del(shoppingListNo) {
            for (let i = 0; i < this.items.length; i++) {
                if (this.items[i].shoppingListNo == shoppingListNo) {
                    this.items.splice(i, 1);
                    break;
                }
            }
        },
        async confirm() {
            let length = this.items.length;
            for (let i = 0; i < length; i++) {
                let flag = false;
                let clLength = this.getCheckedList.length;
                for (let j = 0; j < clLength; j++) {
                    if (flag) break;
                    if (this.items[i].shoppingListNo == this.getCheckedList[j].shoppingListNo) {
                        await http
                            .delete("/shoppingList", {
                                params: {
                                    shoppingListNo: this.getCheckedList[j].shoppingListNo,
                                },
                                withCredentials: true,
                            })
                            .then((response) => {
                                this.items.splice(i, 1);
                                let money = this.getCheckedList[j].productPrice;
                                let no = this.getCheckedList[j].shoppingListNo;
                                this.$store.commit("DEL_ITEM", { money });
                                this.$store.commit("DEL_CHECK_ITEM", { no });
                                i--;
                                length--;
                                flag = true;
                                console.log(response);
                            })
                            .catch((error) => {
                                console.log(error);
                            });
                    }
                }
            }
            console.log();
        },
    },
};
</script>

<style scoped>
.titleLabel {
    text-align: left;
    margin: 2% 10%;
    font-weight: 1000;
    font-size: large;
    width: 80%;
}
.SLHR {
    background-color: grey;
    height: 1.5px;
    border: 2px;
    width: 80%;
    margin: auto;
}
.itemArea {
    max-height: 75%;
    overflow-y: scroll;
}
::-webkit-scrollbar {
    display: none;
}
.totalpriceArea {
    position: fixed;
    bottom: 0;
}
</style>

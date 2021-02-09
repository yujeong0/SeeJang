<template class="wrap">
     <div id="container">
          <div class="titleLabel mb-30">
               My Shopping List
               <hr class="SLHR" style="width: 100%" />
               <shoppingListHeader @check="check"></shoppingListHeader>
          </div>
          <div id="IA" class="itemArea">
               <item
                    v-for="item in items"
                    :allCheck="allCheck"
                    :item="item"
                    :key="item.shoppingListNo"
                    @del="del"
               ></item>
          </div>
          <div class="totalpriceArea">
               <hr class="SLHR" style="width: 80%" />
               <v-row no-gutters>
                    <v-col cols="2" sm></v-col>
                    <v-col style="text-align: left" cols="4"> 예상 총 가격 </v-col>
                    <v-col style="text-align: left"> ₩ {{ getTotalMoney }} </v-col>
               </v-row>
               <div style="margin-bottom: 12px">
                    <v-row no-gutters>
                         <v-col sm style="max-width: 8%; margin-left: 4%">
                              <v-btn
                                   icon
                                   outlined
                                   :class="{ 'jello-vertical': getModalState }"
                                   @click="MyFavorite"
                                   >My</v-btn
                              ></v-col
                         >
                         <v-col sm style="max-width: 25%; margin-left: 4%">
                              <v-btn class="" text @click="addList"
                                   ><v-img src="@/assets/plus.png" style="width: 20px"></v-img>
                                   쇼핑리스트 추가</v-btn
                              >
                         </v-col>
                         <v-col sm style="max-width: 50%">
                              <v-btn class="footerBtns" text @click="confirm"
                                   ><v-img src="@/assets/check.png" style="width: 20px"></v-img>
                                   선택 상품 삭제!</v-btn
                              >
                         </v-col>
                    </v-row>
               </div>
          </div>
     </div>
</template>

<script>
import item from "@/components/shopping/item.vue";
import http from "@/util/http-common.js";
import AddShoppingList from "@/components/shopping/AddShoppingListForm.vue";
import shoppingListHeader from "@/components/shopping/shoppingListHeader.vue";
import MyFavoriteShoppingList from "@/components/shopping/MyFavoriteShoppingList.vue";
import { mapGetters } from "vuex";

export default {
     name: "ShoppingList",
     created() {
          this.$store.commit("SET_ZERO_TOTAL");
          this.$store.commit("INIT_CHECKLIST");
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
     mounted() {},
     updated() {
          /** 쇼핑리스트 높이 맞추는 코드 */
          this.itemArea = document.getElementById("IA");
          let height = this.itemArea.offsetHeight + 80;
          this.itemArea.style.height = `${height}px`;
          this.itemArea.scrollTop = this.itemArea.scrollHeight;
     },
     computed: {
          ...mapGetters(["getTotalMoney", "getCheckedList", "getModalState"]),
     },
     components: {
          item,
          shoppingListHeader,
          MyFavoriteShoppingList,
     },
     data() {
          return {
               items: [],
               allCheck: false,
               itemArea: document.getElementById("IA"),
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
                         height: "65%",
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
                         if (
                              this.items[i].shoppingListNo == this.getCheckedList[j].shoppingListNo
                         ) {
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
          },
          async check(check) {
               this.$store.commit("INIT_CHECKLIST");
               this.allCheck = check;
               this.$store.commit("SET_ZERO_TOTAL");
               let list = [...this.items];
               for (let i = 0; i < list.length; i++) {
                    let element = list[i];
                    element.checked = check;
                    list.splice(i, 1, element);
               }
               await this.items.splice(0);
               this.items = list;
          },
          MyFavorite() {
               this.$store.commit("TOGGLE_MODAL_STATE");
               this.$modal.show(
                    MyFavoriteShoppingList,
                    {
                         add: this.add,
                         addData: "data",
                         modal: this.$modal,
                    },
                    {
                         name: "MyFavoriteShoppingList-modal",

                         width: "70%",
                         height: "65%",
                         draggable: false,
                         shiftY: 0.5,
                    },
                    {
                         closeByName() {
                              this.$modal.hide("MyFavoriteShoppingList-modal");
                         },
                         closeByEvent() {
                              this.$emit("close");
                         },
                    }
               );
          },
     },
};
</script>

<style scoped>
.titleLabel {
     border-bottom: 1px solid;
     text-align: left;
     margin: 0px 10%;
     margin-top: 5%;
     font-weight: 1000;
     font-size: large;
     width: 80%;
     position: fixed;
     background-color: white;
     left: 0;
     right: 0;
     z-index: 10;
}
.SLHR {
     background-color: grey;
     height: 1.5px;
     border: 2px;
     width: 60%;
     margin: auto;
}
.totalpriceArea {
     width: 100%;
     position: fixed;
     bottom: 0;
     background-color: white;
}
.itemArea {
     position: relative;
     padding-top: 80px;
     overflow-y: auto;
     overscroll-behavior: contain;
}
.footerBtns {
     text-align: left;
     margin-left: 4%;
}
.jello-vertical {
     -webkit-animation: jello-vertical 0.9s both;
     animation: jello-vertical 0.9s both;
}
/* ----------------------------------------------
 * Generated by Animista on 2021-2-8 23:6:11
 * Licensed under FreeBSD License.
 * See http://animista.net/license for more info. 
 * w: http://animista.net, t: @cssanimista
 * ---------------------------------------------- */

/**
 * ----------------------------------------
 * animation jello-vertical
 * ----------------------------------------
 */
@-webkit-keyframes jello-vertical {
     0% {
          -webkit-transform: scale3d(1, 1, 1);
          transform: scale3d(1, 1, 1);
     }
     30% {
          -webkit-transform: scale3d(0.75, 1.25, 1);
          transform: scale3d(0.75, 1.25, 1);
     }
     40% {
          -webkit-transform: scale3d(1.25, 0.75, 1);
          transform: scale3d(1.25, 0.75, 1);
     }
     50% {
          -webkit-transform: scale3d(0.85, 1.15, 1);
          transform: scale3d(0.85, 1.15, 1);
     }
     65% {
          -webkit-transform: scale3d(1.05, 0.95, 1);
          transform: scale3d(1.05, 0.95, 1);
     }
     75% {
          -webkit-transform: scale3d(0.95, 1.05, 1);
          transform: scale3d(0.95, 1.05, 1);
     }
     100% {
          -webkit-transform: scale3d(1, 1, 1);
          transform: scale3d(1, 1, 1);
     }
}
@keyframes jello-vertical {
     0% {
          -webkit-transform: scale3d(1, 1, 1);
          transform: scale3d(1, 1, 1);
     }
     30% {
          -webkit-transform: scale3d(0.75, 1.25, 1);
          transform: scale3d(0.75, 1.25, 1);
     }
     40% {
          -webkit-transform: scale3d(1.25, 0.75, 1);
          transform: scale3d(1.25, 0.75, 1);
     }
     50% {
          -webkit-transform: scale3d(0.85, 1.15, 1);
          transform: scale3d(0.85, 1.15, 1);
     }
     65% {
          -webkit-transform: scale3d(1.05, 0.95, 1);
          transform: scale3d(1.05, 0.95, 1);
     }
     75% {
          -webkit-transform: scale3d(0.95, 1.05, 1);
          transform: scale3d(0.95, 1.05, 1);
     }
     100% {
          -webkit-transform: scale3d(1, 1, 1);
          transform: scale3d(1, 1, 1);
     }
}
</style>

<template>
  <div class="board">
    <draggable  class="row dragArea" :list="lists"  group="lists" @end="listMoved" >
      <div v-for="(list, index) in original_lists" class="list">
        <h4>{{ list.name }}</h4>
        <div>
        <draggable :list="list.cards" group="cards" class="dragArea" @change="cardMoved">
          <div v-for="(card, index) in list.cards" class="card card-body mb-3" >
            {{ card.name }}
          </div>
        </draggable>
        </div>
        <div class="card card-body mb-3">
          <textarea v-model="messages[list.id]" class="form-control mb-1" ></textarea>
          <button v-on:click="submitMessages(list.id)" class="btn btn-secondary">Add</button>
        </div>
      </div>
    </draggable>
  </div>
</template>

<script>
import draggable from 'vuedraggable'


export default {
  components: { draggable }, 
  props: ["original_lists"],
  data: function () {
    return {
      messages: {},
      lists: this.original_lists,
    }
  },
  methods: {
    cardMoved: function(event) {
            // console.log(event)
      const evt = event.added || event.moved
      if (evt == undefined) { return }
      
      const element = evt.element

      const list_index = this.lists.findIndex((list) => {
        return list.cards.find((card) => {
          return card.id === element.id
        })
      })

      var data = new FormData
      data.append("card[list_id]", this.lists[list_index].id)
      data.append("card[position]", evt.newIndex + 1)

      Rails.ajax({
        url: `/blog/cards/${element.id}/move`,
        type: "PATCH",
        data: data,
        dataType: "json"
      })
    },
    listMoved: function (event) {
      //       console.log(event)
      var data = new FormData
      data.append("list[position]", event.newIndex + 1)

      Rails.ajax({
        url: `/blog/lists/${this.lists[event.newIndex].id}/move`,
        type: "PATCH",
        data: data,
        dataType: "json"
      })
    },
    submitMessages: function(list_id) {
      var data = new FormData
      data.append("card[list_id]", list_id)
      data.append("card[name]", this.messages[list_id])

      Rails.ajax({
        url: "/blog/cards",
        type: "POST",
        data: data,
        dataType: 'json',
        success: (data) => {
          const index = this.lists.findIndex(item => item.id == list_id)
          this.lists[index].cards.push(data)
          this.messages[list_id] = undefined
        }
      })
    }
  }
}
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }

  .dragArea {
    min-height: 20px;
  }

  .board {
    overflow-x: auto;
    white-space: nowrap;
  }
  .list {
    background: #E2E4E6;
    border-radius: 3px;
    display: inline-block;
    margin-right: 20px;
    padding: 10px;
    vertical-align: top;
    width: 270px;
  }
</style>

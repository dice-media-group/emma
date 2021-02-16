<template>
<draggable v-model="lists"  group="lists" class="row dragArea" @start="dragging = true" @end="listMoved" >
    <div v-for="(list, index) in original_lists" class="col-3">
      <h4>{{ list.name }}</h4>
      <hr />

      <div v-for="(card, index) in list.cards" class="card card-body mb-3" >
        {{ card.name }}
      </div>
      <div class="card card-body mb-3">
        <textarea v-model="messages[list.id]" class="form-control" ></textarea>
        <button v-on:click="submitMessages(list.id)" class="btn btn-secondary">Add</button>
      </div>
    </div>
  </div>
  </draggable>
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
      data.append("blog_card[list_id]", list_id)
      data.append("blog_card[name]", this.messages[list_id])

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
</style>

<template>
  <div class="board">
    <draggable  class="board dragArea" :list="lists"  group="lists" @end="listMoved" >
      <list v-for="(list, index) in original_lists"  :list="list"></list>
    </draggable>
  </div>
</template>

<script>
import draggable from 'vuedraggable'
import list from 'components/list'

export default {
  components: { draggable, list }, 
  props: ["original_lists"],
  data: function () {
    return {
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
  }
}
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }


  .board {
    display: block-inline;
    overflow-x: auto;
    white-space: nowrap;
  }

  .list {
     
  }
</style>

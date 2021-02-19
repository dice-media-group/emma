<template>
  <div class="board">
    <draggable  class="board dragArea" :list="lists"  group="lists" @end="listMoved" >
      <list v-for="(list, index) in lists" :key="list.id" :list="list"></list> 
      <div class="list">
        <a v-if="!editing" v-on:click="startEditing">Add a list…</a>
        <textarea v-if="editing" ref="message" v-model="message" class="form-control mb-1" ></textarea>
        <button v-if="editing" v-on:click="createList" class="btn btn-secondary">Add</button>
        <a v-if="editing" v-on:click="editing=false">Cancel</a>
      </div>
    </draggable>
  </div>
</template>

<script>
import draggable from 'vuedraggable'
import list from 'components/list'

export default {
  components: { draggable, list },

  data: function () {
    return {
      editing: false,
      message: "",
    }
  },

  computed: {
    lists() {
      return this.$store.state.lists;
    }
  },

  methods: {
    createList: function() {
        var data = new FormData
        data.append("list[name]", this.message)

        Rails.ajax({
            url: "/blog/lists",
            type: "POST",
            data: data,
            dataType: 'json',
            success: (data) => {
              this.message = ""
              this.editing = false
            }
        })
    },

    startEditing: function () {
        this.editing = true
        this.$nextTick(() => { this.$refs.message.focus() })                
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
    background: #E2E4E6;
    border-radius: 3px;
    display: inline-block;
    margin-right: 20px;
    padding: 10px;
    vertical-align: top;
    width: 270px;
  }
</style>

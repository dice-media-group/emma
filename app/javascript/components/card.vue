<template>
    <div class="carl">
        <div @click="editing=true" class="card card-body mb-3">
        <img class="rounded" :src="card.image_url" width="120" height="auto">
                    
            {{card.name}} <br>
        </div>


        <div v-if='editing' class="modal-backdrop show"></div>

        <div v-if='editing' @click="closeModal" class="modal show" style="display: block">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{ card.name }}</h5>
            </div>
            <div class="modal-body">
                <input v-model="name" class="form-control"></input>
            </div>
            <div class="modal-footer">
                <button @click="save" type="button" class="btn btn-primary">Save changes</button>
            </div>
            </div>
        </div>
        </div>

    </div>
</template>

<script>
export default {
    props: ['card', 'list'],
    data: function() {
        return{
            editing: false,
            image_url: this.card.image_url,
        }
    },
    
    methods: {
        closeModal: function(event) {
        if (event.target.classList.contains("modal")) { this.editing = false }
        },

        save: function () {
            var data = new FormData
            data.append("card[name]", this.name)

            Rails.ajax({
                url: `/blog/cards/${this.card.id}`,
                type: "PATCH",
                data: data,
                dataType: "json",
                success: (data) => {
                    this.editing = false
                }
            })
        },
    }
}
</script>

<style scoped>

</style>
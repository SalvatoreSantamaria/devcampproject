JQuery(document).on 'turbolinks:load', -> #connect to turbolinks and prevent and conflicts
    comments = $('#comments')
    if comments.length > 0
        App.global_chat = App.cable.subscriptions.create {
            channel: "BlogsChannel"
            blog_id: comments.data('blog-id')
        }
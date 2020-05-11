JQuery(document).on 'turbolinks:load', -> #connect to turbolinks and prevent and conflicts
    comments = $('#comments')
    if comments.length > 0
        App.global_chat = App.cable.subscriptions.create {
            channel: "BlogsChannel"
            blog_id: comments.data('blog-id')
        }, 
        connected: -> #empty for now
        disconnected: -> #empty for now
        received: (data) ->
            comments.append data['comment']
        send_comment: (comment, blog_id) ->
            @perform 'send_comment', comment: comment, blog_id: blog_id
        #look for  new comment
        $('#new_comment'). (e) -> #when submit is pressed
            $this = $(this)
            textarea = $this.find('#comment_content')
            if $.trim(textarea.val()).length > 1 #trim takes out extra whitespace
                App.global_chat.send_comment textarea.val(),
                comments.data('blog-id')
                textarea.val('')
            e.preventDefault()
            return false
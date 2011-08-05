$('#teams').chosen()

$(document).ready(function () {

    $.get('/user/team_feed','',function(response){
        $('.rssFeed').rssfeed(response, { limit: 3 });
    })

});
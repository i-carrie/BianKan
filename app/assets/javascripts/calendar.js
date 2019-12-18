$(function () {
    // 画面遷移を検知
    $(document).on('turbolinks:load', function () {
        // lengthを呼び出すことで、#calendarが存在していた場合はtrueの処理がされ、無い場合はnillを返す
        if ($('#calendar').length) {
            function eventCalendar() {
                return $('#calendar').fullCalendar({
                });
            };
            function clearCalendar() {
                $('#calendar').html('');
            };
  
            $(document).on('turbolinks:load', function () {
                eventCalendar();
            });
            $(document).on('turbolinks:before-cache', clearCalendar);
  
            $('#calendar').fullCalendar({
                events: '/events.json',
                lang: 'ja',
                contentHeight: 'auto',
                //height: 650,
                //height: 'parent',
                displayEventTime: false, // don't show the time column in list view
  
            });
  
        }
    });
  });
  

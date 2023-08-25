
$(document).ready(function () {
    // alert('ok');
    $('#sidebar ul#navbar li.nav-item i.fa-greater-than').click(function () {
        // alert('ok');
        $(this).next('ul.sub-menu').stop().slideToggle();
        $(this).toggleClass('open')
    })
    $(window).resize(function () {
        $('ul.sub-menu').slideUp();
        $('#sidebar ul#navbar li.nav-item i.fa-greater-than').removeClass('open')
    })
    $(window).scroll(function () {
        $('#header').deleteClass('fixed')
        // alert('ok');
    });
    $('#header').addClass('fixed')
    $('#helper').click(function () {
        $(this).toggleClass('active')
    })
    $('#current-user').click(function () {
        $(this).toggleClass('active')
    })
    $('#notify i').click(function () {
        $(this).toggleClass('active')
    })
    $('.custom .custom-item').click(function () {
        $('.custom .custom-item').removeClass('click-active')
        $(this).addClass('click-active')
        $('.custom-item.first').removeClass('click-active')
        // alert('ok')
    })
    $('.custom .custom-item span').click(function () {
        $('.custom .custom-item .custom-detail').slideUp();
        $('input[type="checkbox"]').prop('checked', false);
        $('input[type="radio"]').prop('checked', false);
        $(this).parent('.custom .custom-item').children('.custom .custom-item .custom-detail').stop().slideToggle();
    });
    $("input[name='checkall']").click(function () {
        var checked = $(this).is(':checked');
        $('.table-responsive tbody tr td input:checkbox').prop('checked', checked);
    });
    $('.check-all').click(function () {
        $(this).closest('.module').find('.permission').prop('checked', this.checked)
    })

})

$(document).ready(function() {
    let isDragging = false;
    let offsetX = 0;
    let targetBox = null;

    $('.draggable').on('mousedown', function(e) {
        isDragging = true;
        offsetX = e.clientX - $(this).offset().left;
        targetBox = $(this);
        e.stopPropagation();
    });

    $(document).on('mousemove', function(e) {
        if (isDragging && targetBox) {
            let x = e.clientX - offsetX;            
            console.log(x);
            if (targetBox.attr('id') === 'dot1' && x <= 22) {
                x = 22;
            }

            if (targetBox.attr('id') === 'dot2' && x >= 295) {
                x = 295;
            }

            const dot1Right = $('#dot1').position().left + $('#dot1').width();
            const dot2Left = $('#dot2').position().left;

            if (targetBox.attr('id') === 'dot1' && x + targetBox.width() >= dot2Left) {
                return;
            }

            if (targetBox.attr('id') === 'dot2' && x <= dot1Right) {
                return;
            }

            targetBox.css({
                'left': `${x-20}px`
            });
        }
        e.stopPropagation();
    });

    $(document).on('mouseup', function(e) {
        isDragging = false;
        targetBox = null;
        e.stopPropagation();
    });
});

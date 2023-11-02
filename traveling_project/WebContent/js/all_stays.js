$(document).ready(function() {
	const inputLeft = $('#input_left');
	const inputRight = $('#input_right');
	
	const thumbLeft = $('#left_thumb');
	const thumbRight = $('#right_thumb');
	
	const range = $('.range');
	
	const setLeftValue = (e) => {
        const _this = e.target;
        const { value, min, max } = _this;

        if (+inputRight.val() - +value < 10) {
          _this.value = +inputRight.value - 10;
        }

        const percent = ((+_this.value - +min) / (+max - +min)) * 100;

        $(thumbLeft).css('left', `${percent}%`);
        $(range).css('left', `${percent}%`);
	};
	
    const setRightValue = (e) => {
        const _this = e.target;
        const { value, min, max } = _this;

        if (+value - +inputLeft.val() < 10) {
          _this.value = +inputLeft.val() + 10;
        }

        const percent = ((+_this.value - +min) / (+max - +min)) * 100;

        $(thumbRight).css('right', `${100 - percent}%`);
        $(range).css('right', `${100 - percent}%`);
      };
      
      if (inputLeft && inputRight) {
    	  $(inputLeft).on('input', setLeftValue);
    	  $(inputRight).on('input', setRightValue);
    	}
});

# iOS-custom
some custom view 

在项目中使用的一些自定义view

Button：BtnWithImageAboveTitleStyle: image在上，title在下的自定义按钮，按钮点击事件未处理
        ButtonWithCircleStyle:       圆形按钮，点击区域也是圆形
        PhoneCaptchaButton:          验证码按钮，倒计时

Cell:   InputWithPikerCell:         textfield用于显示通过选择器选择之后的value
        PlayAudioInfoCell:          展示信息而已
        SearchFilterCell:           普通带按钮cell
        TaleIndexCell:              加载图片，添加子view。由于复用，子view会重复显示，须先删除

UIView: CircleProgressView:         圆形进度条
        LabelWithImageAndTitle:     左侧图片，右边label
        PlayAudioListView:          列表view：cell左侧图片，中间文字，右侧图片
        PlayProgressView:           显示播放进度
        SexBtnView:                 性别选择，二选一

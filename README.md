<div dir="rtl">
  mohammadhossein dolatabadi => 98105773 </br>
  seyyed mohammadmahdi mirkamali => 9810 </br>
در بخش اول کلاس‌ها تعریف شده‌اند که دو کلاس TODO و کلاس Category با تعریف کردن فیلد هایش مشخص اند
برای نگهداری اطلاعات TODO ها و Category ها از دو آرایه از همین موجودیت ها استفاده شده است
در بخش بعدی تابع main را داریم که نقش منوی اصلی برنامه رو پیاده سازی کرده و برای بازگشت به منوی اصلی از این فراخوانی این تابع استفاده میکنیم
تابع بعدی برای فانکشنالیتی اول یعنی اضافه کردن تسک است. در این تابع فیلد های مورد نیاز برای ساخت یک تسک از کاربر دریافت میشود و با استفاده از آنها تسک ساخته و به دیتابیس که همان آرایه ای از تودوهاست اضافه میشود
  تابع بعدی تابع نمایش تسک‌ها یا تودوهاست که با یک بار حلقه رفتن روی دیتابیس تمام تسک های موجود که در بخش قبلی به ارایه اضافه شده بودند را نمایش میدهد
  تابع بعدی تابع ویرایش یک تسک است که با دریافت شناسه(آیدی) تسک و پیدا کردن ان در دیتابیس عمل موردنظر که شامل ویرایش عنوان توضیحات و یا الویت تسک است را انجام میدهد
  تابع بعدی تابع حذف یک تسک است که با دریافت شناسه تسک و پیدا کردن ان ان را از دیتابیس حذف میکند
  تابع سورت هم با دریافت گزینه مدنظر کاربر سورت را انجام میدهد در این تابع انواع سورت پیاده‌سازی شده که میتوان براساس الویت یا زمان ساخت تسک یاعنوان که براساس حروف الفبا مرتب میشود تسک‌ها را مرتب کرد در این قسمت برای نمایش تسک ها از همان تابع نمایش تسک ها که در بخش‌های قبلی پیاده‌سازی شده بود استفاده میشود که با دریافت یک آرگومان نوع مرتب‌سازی را مشخص میکند به این صورت که تابع را به صورت سورت شده با استفاده از تابع سورت به تابع viewAll میفرستیم. در این بخش برای مشخص کردن این که سورت و تابع sorted برای عنوان و الویت به چه صورت باشد از دوتابع کمکی به نام‌های titleAsc و priorityAsc استفاده کرده‌ایم. که در پایین همین تابع مشخص هستند.
  تابع های بعدی برای ساخت و استفاده از دسته‌بندی یا همان category است. تابع اول تابع ساخت یک دسته‌بندی است به این صورت که با فراخوانی ان اطلاعات لازم از کاربر گرفته شده و تکراری بودن ان با چک کردن عنوان ان بررسی میشود و درصورت وجود خطای مربوطه نشان داده میشود. در غیراین صورت تسک با موفقیت ساخته میشود. و در نهایت  چه موفقیت امیز باشد چه نه به منوی اصلی بازگردانده میشویم.
  تابع بعدی تابع اضافه کردن یک تسک به یک دسته‌بندی است به این صورت عمل میکند که با دریافت شناسه دسته‌بندی و شناسه تسک از کاربر دسته‌بندی مدنظر را پیدا میکند و تسک مدنظر را به آن اضافه میکند و درنهایت به منوی اصلی بازگردانده میشود.
  تابع اخر هم تابع نمایش تودوهای یک دست‌بندی است که با دریافت شناسه یک دسته‌بندی آن را پیدا و با حلقه زدن روی ممبرهای آن تمام تسک های موجود در آن دسته‌بندی را با ذکر جزئیات نمایش میدهد
  در اخر هم برای شروع برنامه یک پیام خوشامد نمایش داده میشود و تابع نمایش منوی اصلی صدا زده میشود
در حقیقت روند اجرا برنامه به این صورت است که با وارد کردن عدد میتوان کار موردنظر را انجام داد و پس از ان به منوی اصلی باز میگردد و خیلی ساده است.
</div>

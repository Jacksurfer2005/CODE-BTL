% Doc du lieu tu file CSV vao mot bang
data = readtable("supermarket_sales - Sheet1.csv");

% Sap xep du lieu theo thoi gian
sorted_data = sortrows(data, 'Date');

% Tinh tong loi nhuan theo mot ngay
daily_profits = groupsummary(sorted_data, 'Date', 'sum', 'grossIncome');

% Chuyen doi cot ngay thanh doi tuong datetime
daily_profits.Date = datetime(daily_profits.Date);

% Tao bieu do cua loi nhuan hang ngay
plot(daily_profits.Date, daily_profits.sum_grossIncome);
xlabel('Date');
ylabel('Daily Profits');
title('Daily Profits over Time');

% Tinh su khac biet giua cac gia tri loi nhuan lien tiep
profit_diff = diff(daily_profits.sum_grossIncome); % qeqweqw
dates_diff = diff(daily_profits.Date); % qeqweqw

% Tinh dao ham theo thoi gian bang cach chia su khac biet cua loi nhuan cho su khac biet cua thoi gian
profit_rate_of_change = profit_diff ./ days(dates_diff);

% Ve bieu do dao ham the thoi gian
plot(daily_profits.Date(2:end), profit_rate_of_change);
xlabel('Date');
ylabel('Profit Rate of Change');
title('Profit Rate of Change over Time');

% In ket qua
disp('Dao ham loi nhuan theo thoi gian:');
disp(profit_rate_of_change);
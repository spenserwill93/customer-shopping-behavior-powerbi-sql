Create Database CustomerRetail;
Go

Use CustomerRetail;

Create Table dim_customer (
	CustomerKey Int Identity(1,1) Primary Key,
	CustomerID Int,
	Age Int,
	Gender Varchar(50),
	SubscriptionStatus Varchar(50),
	FrequencyOfPurchases Varchar(50)
	);

Insert Into dim_customer (CustomerID, Age, Gender, SubscriptionStatus, FrequencyOfPurchases)
Select Distinct
	Customer_ID,
	Age,
	Gender,
	Subscription_Status,
	Frequency_Of_Purchases
From shopping_trends_stage;

Create Table dim_product ( 
	ProductKey Int Identity(1,1) Primary Key,
	ItemPurchased Varchar(100),
	Category Varchar(50),
	Size Varchar(50),
	Color Varchar(50)
	);

Insert Into dim_product (ItemPurchased, Category, Size, Color)
Select Distinct 
	Item_Purchased,
	Category,
	Size,
	Color
From shopping_trends_stage;

Create Table dim_location (
LocationKey Int Identity(1,1) Primary Key,
Location Varchar(50)
);

Insert Into dim_location(Location)
Select Distinct 
	Location
From shopping_trends_stage;

CREATE TABLE dbo.dim_season (
    SeasonKey INT IDENTITY(1,1) PRIMARY KEY,
    Season VARCHAR(20)
);

INSERT INTO dbo.dim_season (Season)
SELECT DISTINCT Season
FROM shopping_trends_stage;

CREATE TABLE dim_payment (
    PaymentKey INT IDENTITY(1,1) PRIMARY KEY,
    PaymentMethod VARCHAR(30)
);

INSERT INTO dbo.dim_payment (PaymentMethod)
SELECT DISTINCT Payment_Method
From shopping_trends_stage;

CREATE TABLE dim_shipping (
    ShippingKey INT IDENTITY(1,1) PRIMARY KEY,
    ShippingType VARCHAR(30)
);

INSERT INTO dbo.dim_shipping (ShippingType)
SELECT DISTINCT Shipping_Type
From shopping_trends_stage;

CREATE TABLE fact_purchases (
    PurchaseKey INT IDENTITY(1,1) PRIMARY KEY,
	CustomerKey INT,
    ProductKey INT,
    LocationKey INT,
    SeasonKey INT,
    PaymentKey INT,
    ShippingKey INT,
	PurchaseAmountUSD DECIMAL(10,2),
    ReviewRating DECIMAL(3,2),
    DiscountApplied VARCHAR(5),
    PromoCodeUsed VARCHAR(5),
    PreviousPurchases INT
);

INSERT INTO dbo.fact_purchases (
    CustomerKey,
    ProductKey,
    LocationKey,
    SeasonKey,
    PaymentKey,
    ShippingKey,
    PurchaseAmountUSD,
    ReviewRating,
    DiscountApplied,
    PromoCodeUsed,
    PreviousPurchases
)
SELECT
    c.CustomerKey,
    p.ProductKey,
    l.LocationKey,
    s.SeasonKey,
    pay.PaymentKey,
    sh.ShippingKey,
    st.Purchase_Amount_USD,
    st.Review_Rating,
    st.Discount_Applied,
    st.Promo_Code_Used,
    st.Previous_Purchases
FROM shopping_trends_stage st
JOIN dbo.dim_customer c
    ON st.Customer_ID = c.CustomerID
JOIN dbo.dim_product p
    ON st.Item_Purchased = p.ItemPurchased
   AND st.Category = p.Category
   AND st.Size = p.Size
   AND st.Color = p.Color
JOIN dbo.dim_location l
    ON st.Location = l.Location
JOIN dbo.dim_season s
    ON st.Season = s.Season
JOIN dbo.dim_payment pay
    ON st.Payment_Method = pay.PaymentMethod
JOIN dbo.dim_shipping sh
    ON st.Shipping_Type = sh.ShippingType;

Select *
From fact_purchases;
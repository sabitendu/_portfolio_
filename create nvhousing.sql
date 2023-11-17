CREATE DATABASE portfolio;
--create the table--

DROP TABLE IF EXISTS NVHousing;

CREATE TABLE NVHousing (
    UniqueID INT,
    ParcelID VARCHAR(20),
    LandUse VARCHAR(50),
    PropertyAddress VARCHAR(255),
    SaleDate VARCHAR(20),
    SalePrice VARCHAR(20),
    LegalReference VARCHAR(50),
    SoldAsVacant VARCHAR(3),
    OwnerName VARCHAR(255),
    OwnerAddress VARCHAR(255),
    Acreage NUMERIC,
    TaxDistrict VARCHAR(50),
    LandValue NUMERIC,
    BuildingValue NUMERIC,
    TotalValue NUMERIC,
    YearBuilt INT,
    Bedrooms INT,
    FullBath INT,
    HalfBath INT
);


--copy the excel data---

COPY NVHousing FROM 'C:\Users\Dell\Downloads\Nashville Housing Data.csv' DELIMITER ',' CSV HEADER;
--check the data-- 

SELECT * FROM NVHousing
/*

Cleaning Data in SQL Queries

*/


Select *
From NVHousing

-- Standardize Date Format-------




-- Add a new column to the table
ALTER TABLE NVHousing
ADD COLUMN SaleDateConverted DATE;

-- Update the new column with the converted date values
UPDATE NVHousing
SET SaleDateConverted = TO_DATE(SaleDate, 'MM-DD-YY');

--Convert the saleprice column datatype---

-- remove the ',' in the data--
UPDATE NVHousing
SET SalePrice = REPLACE(SalePrice, ',', '');
--remove the '$' in the data--
UPDATE NVHousing
SET SalePrice = REPLACE(SalePrice, '$', '');
--convert the datatype--
ALTER TABLE NVHousing
ALTER COLUMN SalePrice TYPE bigint
USING SalePrice::bigint;




-- Populate Property Address data----

Select *
From NVHousing
--Where PropertyAddress is null
order by ParcelID

SELECT a.ParcelID, a.PropertyAddress AS AddressA, b.ParcelID, b.PropertyAddress AS AddressB, COALESCE(a.PropertyAddress, b.PropertyAddress) AS MergedAddress
FROM NVHousing a
JOIN NVHousing b ON a.ParcelID = b.ParcelID AND a.UniqueID <> b.UniqueID
WHERE a.PropertyAddress IS NULL;


--update the propertyaddress null value--
	
UPDATE NVHousing a
SET PropertyAddress = b.PropertyAddress
FROM (
    SELECT DISTINCT ON (a.ParcelID)
        a.ParcelID,
        b.PropertyAddress
    FROM NVHousing a
    JOIN NVHousing b ON a.ParcelID = b.ParcelID AND a.UniqueID <> b.UniqueID
    WHERE a.PropertyAddress IS NULL
) b
WHERE a.ParcelID = b.ParcelID AND a.PropertyAddress IS NULL;



SELECT DISTINCT PropertyAddress
FROM NVHousing;
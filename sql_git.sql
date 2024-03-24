SELECT * FROM COVID_DEATHS
SELECT * FROM COVID_VACCINES


SELECT location, date, total_cases, new_cases, total_deaths, population
FROM COVID_DEATHS
ORDER BY 1,2

-- LOOKING AT NEW CASES vs POPULATION
-- SHOWS THE PERCENTAGE OF POPULATION IN THAT COUNTRY 

SELECT location, date, population, new_cases, (new_cases/population)*100 AS DEATHPERCENTAGE
FROM COVID_DEATHS
 -- WHERE LOCATION LIKE '%Belgium%'
ORDER BY 1,2

-- LOOKING AT COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO POPULATION

SELECT location, population, MAX(new_cases) AS HIGHEST_INFECTION_OUNTRY, MAX(new_cases/population)*100 AS COVID_CASES_PERCENTAGE 
FROM COVID_DEATHS
-- WHERE LOCATION = '%Africa%'
GROUP BY location, population
ORDER BY COVID_CASES_PERCENTAGE DESC

-- SHOWING THE COUNTRIES WITH HIGHEST DEATH COUNT PER POPULATION In ACC. TO  NEW DEATHS SMOOTHED VS NEW CASES SMOOTHED

SELECT location, MAX(cast(population as decimal) ) AS POPULATION ,MAX((new_deaths_smoothed /new_cases_smoothed) *100) AS SMOOTHED
FROM COVID_DEATHS
WHERE new_deaths_smoothed != 0 AND new_cases_smoothed != 0 
GROUP BY location,population, new_deaths_smoothed, new_cases_smoothed
ORDER BY population desc

-- LETS BREAK THINGS DOWN BY CONTINENT

SELECT continent, MAX(cast(population as decimal) ) AS POPULATION ,MAX((new_deaths_smoothed /new_cases_smoothed) *100) AS SMOOTHED
FROM COVID_DEATHS
WHERE new_deaths_smoothed != 0 AND new_cases_smoothed != 0  AND continent IS NOT NULL
GROUP BY continent 
ORDER BY continent desc 







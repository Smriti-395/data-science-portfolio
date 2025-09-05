# 🚢 Titanic Survival Analysis

## 📌 Project Overview
- This project analyzes the **Titanic dataset** to explore survival patterns among passengers.
- The goal is to understand which factors (age, gender, class, etc.) influenced survival.

## 📊 Dataset
- **Source**: [Kaggle Titanic Dataset](https://www.kaggle.com/c/titanic/data)
- Columns used: `PassengerId`, `Survived`, `Pclass`, `Name`, `Sex`, `Age`, `SibSp`, `Parch`, `Ticket`, `Fare`, `Cabin`, `Embarked`.

## ⚙️ Tools & Libraries
- Python
- Pandas
- Matplotlib
- Seaborn

## 🔎 Key Analysis & Visualizations
1. **Data Cleaning & Missing Values**
   - Checked for missing values in `Age`, `Cabin`, `Embarked`.  
   - Imputed or dropped missing values as required.  

2. **Survival by Gender**
   - Survival rate was **higher among females** compared to males. 

3. **Survival by Passenger Class**
   - Passengers in **1st class had better survival chances** than 2nd and 3rd class.  

4. **Age Distribution**
   - Most passengers were in the **20–30 years age range**. 

5. **Fare vs Survival**
   - Higher fares were often associated with higher survival probability.  

6. **Correlation Heatmap**
   - Heatmap of numeric features showed relationships between variables.

---

## 📌 Observations
- Females had a **much higher survival rate** than males.  
- **1st class passengers** were prioritized in rescue operations.  
- Age distribution skewed towards young adults (20–30 years).  
- Fare and family size influenced survival chances.  

---

## 🚀 How to Run
1. Open `Titanic_Dataset_Exploratory_Analysis.ipynb` in Jupyter/Colab.  
2. Install dependencies:
   ```bash
   pip install pandas matplotlib seaborn
Run the notebook cells step by step.


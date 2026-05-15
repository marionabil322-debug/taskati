# ⚡ FitPulse | Advanced Fitness Tracking Engine

**FitPulse** هو تطبيق متطور لتتبع اللياقة البدنية مصمم بأسلوب **Clean Architecture** لضمان الكفاءة والقابلية للتوسع. يوفر التطبيق تجربة مستخدم فريدة تدمج بين تتبع الأنشطة الرياضية، إدارة الأهداف الصحية، وتحليل البيانات الحيوية.
---
## 📸 App Showcase

<details>
<summary>اضغط لمشاهدة لقطات الشاشة (Click to expand screenshots)</summary>
  
| Dashboard | Real-time Stats | Exercise Library |
|:---:|:---:|:---:|
| <img src="screenshots/home.png" width="220"> | <img src="screenshots/stats.png" width="220"> | <img src="screenshots/exercises.png" width="220"> |

| Active Session | Health Goals | Dark Mode Engine |
|:---:|:---:|:---:|
| <img src="screenshots/active.png" width="220"> | <img src="screenshots/goals.png" width="220"> | <img src="screenshots/settings.png" width="220"> |

</details>
## 🛠 Technical Architecture (البنية التقنية)

يعتمد التطبيق على مبادئ برمجية قوية لضمان سهولة الصيانة:

* **State Management:** استخدام `Provider` لإدارة الحالة وتوفير البيانات بشكل فعال عبر الشاشات.
* **Theming Engine:** نظام ديناميكي للتبديل بين الـ Dark/Light Mode مع الحفاظ على تجربة بصرية مريحة.
* **Navigation:** نظام Routing منظم لتسهيل التنقل بين الشاشات المعقدة.
* **Custom Painting & UI:** استخدام Custom Shapes و Widgets مخصصة لتمثيل الرسوم البيانية (Statistics Charts).

---

## 🚀 Key Features (المميزات الرئيسية)

### 🏃‍♂️ Workout Management
- مكتبة تمارين شاملة مصنفة حسب العضلات المستهدفة.
- واجهة تمرين نشطة (Active Workout) تتبع المجموعات والوقت والسعرات بدقة.

### 📊 Advanced Analytics
- رسوم بيانية توضح النشاط الأسبوعي.
- تحليل توزيع التمارين (Breakdown) لمعرفة التركيز العضلي للمستخدم.

### 🎯 Goal Oriented System
- تتبع شرب الماء، الخطوات اليومية، والوزن المستهدف باستخدام Sliders تفاعلية.
- مؤشر كتلة الجسم (BMI) مع تحليل تلقائي للحالة الصحية.

---

<img width="390" height="853" alt="Screenshot 2026-05-15 203822" src="https://github.com/user-attachments/assets/d9b42583-9c0f-4db8-a8c4-f9d6677f03b8" />
<img width="391" height="859" alt="Screenshot 2026-05-15 202434" src="https://github.com/user-attachments/assets/df6d568f-e696-414b-9fe1-7f8a3fbbe9c9" />
<img width="391" height="858" alt="Screenshot 2026-05-15 202503" src="https://github.com/user-attachments/assets/6d27b7ed-3caf-4090-a950-17cb5b6d30f5" />
<img width="392" height="856" alt="Screenshot 2026-05-15 202419" src="https://github.com/user-attachments/assets/f11c452f-1f9c-447e-852b-afc247803424" />
<img width="398" height="858" alt="Screenshot 2026-05-15 202330" src="https://github.com/user-attachments/assets/daf7419c-af77-4002-89ee-4ba1db50e787" />
<img width="392" height="857" alt="Screenshot 2026-05-15 202245" src="https://github.com/user-attachments/assets/cedb8df4-4f72-4a0c-93e5-7c1e5102f78f" />
<img width="393" height="858" alt="Screenshot 2026-05-15 202309" src="https://github.com/user-attachments/assets/9705d90e-58b0-4dbe-8ad7-f1c0834a706b" />
<img width="393" height="853" alt="Screenshot 2026-05-15 202232" src="https://github.com/user-attachments/assets/497d191d-3628-4e81-af19-e97bf713deef" />
<img width="389" height="855" alt="Screenshot 2026-05-15 202213" src="https://github.com/user-attachments/assets/35e51df6-1691-4a1e-a2c0-9523ddbe0741" />

## 🏗 Project Folder Structure

```text
lib/
 ├── core/
 │    ├── theme/      # App Colors, ThemeProvider
 │    └── utils/      # Constants, Helpers
 ├── models/          # Data Models (Exercise, UserStats)
 ├── screens/         # Feature-based UI Screens
 ├── widgets/         # Reusable UI Components (Cards, Buttons)
 └── app.dart         # Main Application Entry & Routes




<img width="392" height="848" alt="Screenshot 2026-05-15 202044" src="https://github.com/user-attachments/assets/3f68d543-4436-4a74-b283-6d15562d7747" />

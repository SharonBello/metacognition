import React from 'react';
import styles from './MethodsIntro.module.scss';

const MethodsIntro: React.FC = () => (
  <section className={styles.section}>
    <span className={styles.eyebrow}>שלוש שיטות מתורגלות</span>
    <h2 className={styles.title}>שלוש שיטות — שלושת השלבים של הלולאה.</h2>
    <p className={styles.lede}>
      בחרנו שיטה לכל שלב של הלולאה המטא-קוגניטיבית. KWL = <em>תכנון</em>.
      חשיבה רועשת = <em>ניטור גלוי</em>. כרטיסי יציאה = <em>הערכה</em>. ככה
      בסוף ההשתלמות יש לכם כיסוי לכל שיעור — מההתחלה ועד הסוף.
    </p>
    <ul className={styles.previewList}>
      <li><strong>KWL</strong> · לפתיחת יחידה. מוציא ידע מוקדם ותפיסות שגויות.</li>
      <li><strong>חשיבה רועשת</strong> · לאמצע. מדגים תהליך לכיתה שיודעת תשובה אך לא דרך.</li>
      <li><strong>כרטיסי יציאה</strong> · לסוף שיעור. תמונת מצב — לא ציון.</li>
    </ul>
  </section>
);

export default MethodsIntro;
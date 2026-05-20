import React from 'react';
import styles from './GapIntro.module.scss';

const GapIntro: React.FC = () => (
  <section className={styles.section}>
    <span className={styles.eyebrow}>תרגיל חי · ⌗ 1</span>
    <h2 className={styles.title}>
      תוצאה קצרה. חשיבה ארוכה. הפער הזה — הוא ההוראה.
    </h2>
    <p className={styles.lede}>
      בשני התרגילים הבאים תכתבו פעמיים. בפעם הראשונה — <em>התוצר</em>: מערך
      פתיחה מהיר. בפעם השנייה — <em>החשיבה שמאחורי</em>. נראה מה שני אלה
      אומרים זה על זה.
    </p>

    <ol className={styles.steps}>
      <li><span>שלב 1</span> 60 שניות. תכננו פתיחה לשיעור על שברים, כיתה ד׳.</li>
      <li><span>שלב 2</span> 5 דקות. כתבו את כל מה שעבר לכם בראש בזמן השלב 1.</li>
      <li><span>שלב 3</span> השוו. תופתעו.</li>
    </ol>
  </section>
);

export default GapIntro;
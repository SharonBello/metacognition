// ═══════════════════════════════════════════════════════════════════
// AIReframe — metacognition-specific framing:
// AI doesn't think FOR the student. It makes the thinking visible.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './AIReframe.module.scss';

const CANNOT = [
  'איך התלמיד שלך באמת ניגש לבעיה (רק הוא יודע)',
  'איפה התקיעות שלו הסתירה — שעמום, חרדה, פער ידע',
  'מה הוא חושב שהוא יודע, אבל לא',
  'את הקצב הספציפי של הכיתה שלך, את האנרגיה של חמישי-אחרי-טסטים',
  'את ההבדל בין "שתק כי הבין" לבין "שתק כי איבד אותך"',
];

const CAN = [
  'לייצר מבני KWL מותאמים לנושא ולגיל — בדקה',
  'להפיק תסריטי "חשיבה רועשת" שמדגימים תהליך, לא רק תוצאה',
  'להציע 5 וריאציות של כרטיס יציאה — כל אחת חושפת ממד אחר',
  'להעלות תפיסות שגויות שאפילו מורים מנוסים מפספסים',
  'לכתוב סקריפט שאלות-עצמיות לתלמיד שתקוע',
];

const AIReframe: React.FC = () => (
  <section className={styles.section}>
    <header className={styles.head}>
      <span className={styles.eyebrow}>עכשיו AI נכנס</span>
      <h2 className={styles.title}>
        הוא לא חושב <em>במקום</em> התלמיד. הוא עוזר לכם לעשות את החשיבה <em>נראית</em>.
      </h2>
      <p className={styles.lede}>
        בארבעת החלקים הקודמים תרגלתם מטא-קוגניציה — לבד. עכשיו נראה איך כלי
        אחד יכול להפוך אותה למהירה ושיטתית בכיתה. לפני שמתחילים, חשוב להיות
        ברור: מה הוא <em>לא</em> ידע, ומה הוא <em>כן</em>.
      </p>
    </header>

    <div className={styles.split}>
      <div className={styles.col}>
        <span className={styles.colTag}>AI לא ידע</span>
        <ul className={styles.list}>
          {CANNOT.map((t, i) => <li key={i}>{t}</li>)}
        </ul>
        <p className={styles.colCoda}>
          לכן <strong>אתם</strong> מפענחים את הכרטיס שחזר. AI מייצר את הכלי —
          הקריאה בו, היא שלכם.
        </p>
      </div>

      <div className={styles.divider} aria-hidden />

      <div className={styles.col}>
        <span className={[styles.colTag, styles.colTagAccent].join(' ')}>AI יעזור עם</span>
        <ul className={styles.list}>
          {CAN.map((t, i) => <li key={i}>{t}</li>)}
        </ul>
        <p className={styles.colCoda}>
          <strong>הצוואר הצר של מטא-קוגניציה בכיתה</strong> הוא לא הכלים — הם
          מוכרים. הוא <em>זמן להכנה</em>. בדיוק שם AI עוזר.
        </p>
      </div>
    </div>
  </section>
);

export default AIReframe;
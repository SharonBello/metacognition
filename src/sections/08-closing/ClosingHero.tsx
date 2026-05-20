// ═══════════════════════════════════════════════════════════════════
// ClosingHero — opens Section 8 with summary of what was built.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './ClosingHero.module.scss';

const STATS = [
  { value: '4', labelHe: 'שיעורים מוכנים' },
  { value: '5', labelHe: 'כרטיסיות פרומפט' },
  { value: '3', labelHe: 'שיטות מטא-קוגניציה' },
];

const ClosingHero: React.FC = () => (
  <section className={styles.section}>
    <span className={styles.eyebrow}>סיכום</span>
    <h2 className={styles.title}>בשעתיים וחצי האחרונות בניתם תשתית, לא רק שיעור.</h2>
    <p className={styles.lede}>
      תרגלתם מטא-קוגניציה על עצמכם. ראיתם איך הפער בין תוצר לבין חשיבה הוא
      ההוראה האמיתית. בניתם שיעור על נושא אמיתי בכיתה אמיתית. <em>שלוש
      השיטות שיצאו לכם הביתה</em> — מכסות את הלולאה המטא-קוגניטיבית מההתחלה
      של היחידה ועד הסוף של שיעור בודד.
    </p>

    <dl className={styles.stats}>
      {STATS.map(s => (
        <div key={s.labelHe} className={styles.stat}>
          <dt className={styles.statValue}>{s.value}</dt>
          <dd className={styles.statLabel}>{s.labelHe}</dd>
        </div>
      ))}
    </dl>
  </section>
);

export default ClosingHero;
// ═══════════════════════════════════════════════════════════════════
// LearningCase — three reasons metacognition matters for student
// learning. Evidence-grounded.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './LearningCase.module.scss';

interface Reason {
  number: string;
  title: string;
  body: string;
  source: string;
}

const REASONS: Reason[] = [
  {
    number: '01',
    title: 'השפעה של כמעט שנת לימוד נוספת',
    body: 'במטא-אנליזה של ג׳ון האטי על למעלה מ-800 מחקרים, אסטרטגיות מטא-קוגניטיביות מקבלות גודל-השפעה של d ≈ 0.69 — מה ששווה לכמעט שנת לימוד שלמה נוספת לתלמיד. רק חזרה מרווחת ובדיקה עצמית מתחרות בעוצמה הזאת.',
    source: "Hattie · Visible Learning · 2009/2023",
  },
  {
    number: '02',
    title: 'הטכניקות החזקות ביותר — כולן מטא-קוגניטיביות',
    body: 'מחקר השוואתי של 10 טכניקות לימוד מצא ששלוש בעלות התועלת הגבוהה ביותר — בדיקה עצמית, פרקטיקה מרווחת, והסבר עצמי — כולן מסתמכות על מודעות התלמיד לתהליך הלמידה שלו. דגשנים כמו "הדגשה" ו"קריאה חוזרת" — נמצאו כמעט לא יעילים.',
    source: 'Dunlosky et al · Improving Students Learning · 2013',
  },
  {
    number: '03',
    title: 'משפיע יותר על מי שהכי זקוק לעזרה',
    body: 'תלמידים חזקים כבר מפעילים מטא-קוגניציה באופן לא-מודע. תלמידים מתקשים — לא. כשהמיומנות נלמדת במפורש, הפער מצטמצם. זה אחד מהמהלכים הפדגוגיים היחידים שמשפיעים יותר על תלמידים חלשים מאשר על חזקים.',
    source: 'EEF · Teaching & Learning Toolkit · 2021',
  },
];

const LearningCase: React.FC = () => (
  <section className={styles.section}>
    <header className={styles.head}>
      <span className={styles.eyebrow}>למה זה חשוב</span>
      <h2 className={styles.title}>שלוש סיבות פדגוגיות — לפני שמדברים על AI.</h2>
      <p className={styles.lede}>
        מטא-קוגניציה היא לא מילה אופנתית. היא <em>אחת המיומנויות החזקות
        ביותר</em> שאפשר ללמד תלמיד — לפי כל מחקר רציני בעשרים השנים האחרונות.
      </p>
    </header>

    <ol className={styles.list}>
      {REASONS.map(r => (
        <li key={r.number} className={styles.item}>
          <span className={styles.num}>{r.number}</span>
          <div className={styles.text}>
            <h3 className={styles.itemTitle}>{r.title}</h3>
            <p className={styles.itemBody}>{r.body}</p>
            <p className={styles.itemSource}>{r.source}</p>
          </div>
        </li>
      ))}
    </ol>

    <aside className={styles.pull}>
      "תלמיד שיודע איך הוא יודע — מנצח את התלמיד שיודע יותר."
    </aside>
  </section>
);

export default LearningCase;
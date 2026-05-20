// ═══════════════════════════════════════════════════════════════════
// GapReflection — names the cognitive move just exercised.
// The gap between draft and thinking IS metacognition.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './GapReflection.module.scss';

const GapReflection: React.FC = () => (
  <section className={styles.section}>
    <span className={styles.eyebrow}>מה הרגע עשיתם</span>
    <h2 className={styles.title}>
      בדיוק עשיתם מטא-קוגניציה <em>על עצמכם</em>.
    </h2>

    <div className={styles.split}>
      <div className={styles.col}>
        <h3 className={styles.colTitle}>
          <span className={styles.colNum}>01</span>
          חשבתם
        </h3>
        <p className={styles.colBody}>
          תכננתם פתיחה — לכאורה פעולה אחת. בפועל: 10-20 פעולות-משנה, רובן
          לא-מודעות. רעיונות שעלו ונדחו. הנחות שעשיתם. אנלוגיות שניסיתם
          וזרקתם.
        </p>
      </div>
      <div className={styles.col}>
        <h3 className={styles.colTitle}>
          <span className={styles.colNum}>02</span>
          חשבתם על החשיבה
        </h3>
        <p className={styles.colBody}>
          הסתכלתם אחורה ופירקתם את הרצף. שאלתם את עצמכם "מה הנחתי?". זיהיתם
          את "כמעט-טעיתי". זה <em>בדיוק</em> מה שמטא-קוגניציה היא.
        </p>
      </div>
    </div>

    <aside className={styles.takeaway}>
      <hr className={styles.rule} aria-hidden />
      <p>
        <strong>ההזדמנות הפדגוגית:</strong> רוב התלמידים פועלים על מצב 01
        בלבד. הם חושבים, אבל לא רואים את החשיבה שלהם. <strong>תפקיד המורה</strong> —
        בעזרת או בלי AI — הוא ללמד אותם את המצב השני. את היכולת להסתכל אחורה
        ולשאול "מה עשיתי שם, בעצם?".
      </p>
      <p className={styles.next}>
        בחלק הבא — ארבעה כלים מתורגלים בכיתה. כדי לעבור מ"אני עושה את זה" אל
        "אני יודעת ללמד את זה".
      </p>
    </aside>
  </section>
);

export default GapReflection;
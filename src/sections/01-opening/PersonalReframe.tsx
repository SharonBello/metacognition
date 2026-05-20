// ═══════════════════════════════════════════════════════════════════
// PersonalReframe — the teacher already practices metacognition every
// day. The workshop won't add a "new skill" — it'll name what they
// already do and make it teachable.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './PersonalReframe.module.scss';

const MOMENTS: string[] = [
  'מתי תכננתם שיעור ועצרתם לשאול: "מה יכול לקרוס פה?"',
  'מתי באמצע שיעור החלפתם את ההסבר כי הבחנתם בעיניים מבולבלות?',
  'מתי שאלתם תלמיד "איך הגעת לתשובה הזאת?" — לא בודק תשובה, בודק תהליך?',
  'מתי בסוף שיעור חשבתם "בפעם הבאה אני אעשה זה אחרת" — וזה היה ברור למה?',
];

const PersonalReframe: React.FC = () => (
  <section className={styles.section}>
    <header className={styles.head}>
      <span className={styles.eyebrow}>אתם כבר עושים את זה</span>
      <h2 className={styles.title}>
        מטא-קוגניציה היא לא <em>מילה חדשה</em>. היא מה שאתם עושים כל יום.
      </h2>
      <p className={styles.lede}>
        רוב המורים אומרים "אני לא מומחה למטא-קוגניציה". זה כמעט תמיד לא נכון.
        מורים טובים מפעילים אותה על עצמם בלי הפסקה — לפני, תוך כדי, ואחרי
        השיעור. הנה ארבעה רגעים שלכם בחודש האחרון:
      </p>
    </header>

    <ul className={styles.moments}>
      {MOMENTS.map((m, i) => (
        <li key={i} className={styles.moment}>
          <span className={styles.dot} aria-hidden />
          <span>{m}</span>
        </li>
      ))}
    </ul>

    <div className={styles.bridge}>
      <hr className={styles.rule} aria-hidden />
      <p className={styles.bridgeText}>
        כל אלה — מטא-קוגניציה. ההשתלמות הזאת לא מלמדת אתכם מיומנות חדשה. היא
        תיתן לכם <strong>שמות ומבנים</strong> למה שאתם כבר עושים — כדי שתוכלו
        ללמד את התלמידים לעשות זאת בעצמם.
      </p>
      <p className={styles.bridgeNext}>
        בחלק הבא — תרגיל קצר. שיראה משהו חשוב על עצמכם.
      </p>
    </div>
  </section>
);

export default PersonalReframe;
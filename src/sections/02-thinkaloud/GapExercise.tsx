// ═══════════════════════════════════════════════════════════════════
// GapExercise — 3-phase live exercise.
// Phase 1: 60-second quick draft of a teaching opener
// Phase 2: 5-minute expansion of the FULL thinking that produced it
// Phase 3: comparison — count of words/lines on each
// All state persists in localStorage.
// ═══════════════════════════════════════════════════════════════════
import React, { useEffect, useMemo, useState } from 'react';
import { TbArrowLeft } from 'react-icons/tb';
import styles from './GapExercise.module.scss';

const KEY_DRAFT  = 'binai.m06.gap.draft.v1';
const KEY_THINK  = 'binai.m06.gap.thinking.v1';

type Phase = 1 | 2 | 3;

function loadStr(key: string, fallback: string): string {
  try { return localStorage.getItem(key) ?? fallback; } catch { return fallback; }
}
function saveStr(key: string, value: string): void {
  try { localStorage.setItem(key, value); } catch { /* noop */ }
}

function wordCount(s: string): number {
  return s.trim() === '' ? 0 : s.trim().split(/\s+/).length;
}

const GapExercise: React.FC = () => {
  const [phase, setPhase] = useState<Phase>(1);
  const [draft, setDraft]       = useState<string>(() => loadStr(KEY_DRAFT, ''));
  const [thinking, setThinking] = useState<string>(() => loadStr(KEY_THINK, ''));

  useEffect(() => { saveStr(KEY_DRAFT, draft);    }, [draft]);
  useEffect(() => { saveStr(KEY_THINK, thinking); }, [thinking]);

  const draftWords    = useMemo(() => wordCount(draft),    [draft]);
  const thinkingWords = useMemo(() => wordCount(thinking), [thinking]);
  const ratio         = useMemo(
    () => draftWords > 0 ? Math.round(thinkingWords / draftWords) : 0,
    [draftWords, thinkingWords],
  );

  const canAdvanceFrom1 = draftWords >= 10;
  const canAdvanceFrom2 = thinkingWords >= 30;

  return (
    <section className={styles.section}>
      <div className={styles.phaseTabs} aria-label="שלב נוכחי">
        {[1, 2, 3].map(n => (
          <button
            key={n}
            type="button"
            className={[styles.tab, phase === n && styles.tabActive].filter(Boolean).join(' ')}
            onClick={() => {
              if (n === 1) setPhase(1);
              if (n === 2 && canAdvanceFrom1) setPhase(2);
              if (n === 3 && canAdvanceFrom1 && canAdvanceFrom2) setPhase(3);
            }}
            disabled={
              (n === 2 && !canAdvanceFrom1) ||
              (n === 3 && !(canAdvanceFrom1 && canAdvanceFrom2))
            }
          >
            <span className={styles.tabNum}>0{n}</span>
            <span className={styles.tabLabel}>
              {n === 1 ? 'התוצר' : n === 2 ? 'החשיבה' : 'הפער'}
            </span>
          </button>
        ))}
      </div>

      {/* PHASE 1 — quick draft */}
      {phase === 1 && (
        <div className={styles.phase}>
          <h3 className={styles.phaseTitle}>פתיחה לשיעור על שברים, כיתה ד׳ · 60 שניות</h3>
          <p className={styles.phaseHint}>
            רגע — לפני שאתם מתחילים: <strong>אל תחשבו על מה שאתם חושבים.</strong>
            פשוט כתבו את הפתיחה. כאילו אתם בלוח השעות, שיעור עוד 90 שניות,
            וצריך משהו על הרגליים. <em>שתי שורות, שלוש שורות, מקסימום.</em>
          </p>
          <textarea
            className={styles.textarea}
            value={draft}
            onChange={e => setDraft(e.target.value)}
            placeholder="הפתיחה שלי..."
            rows={5}
          />
          <div className={styles.phaseFooter}>
            <span className={styles.counter}>
              {draftWords} <em>מילים</em>
            </span>
            <button
              type="button"
              className={styles.next}
              onClick={() => setPhase(2)}
              disabled={!canAdvanceFrom1}
            >
              <span>עכשיו — החשיבה</span>
              <TbArrowLeft aria-hidden />
            </button>
          </div>
        </div>
      )}

      {/* PHASE 2 — the thinking behind */}
      {phase === 2 && (
        <div className={styles.phase}>
          <h3 className={styles.phaseTitle}>5 דקות · כל מה שעבר בראש</h3>
          <p className={styles.phaseHint}>
            עכשיו — כתבו את <strong>החשיבה</strong>. הכל. כולל:
          </p>
          <ul className={styles.checklist}>
            <li>הרעיון הראשון שדחיתם (למה דחיתם?)</li>
            <li>מה הנחתם על התלמידים — בלי לבדוק</li>
            <li>אנלוגיה שכמעט בחרתם והחלפתם</li>
            <li>"רגע — האם זה באמת..." — היסוס שעצרתם בו</li>
            <li>זיכרון מקצועי שכיוון אתכם ("פעם, עם כיתה ג, ניסיתי...")</li>
          </ul>
          <textarea
            className={styles.textarea}
            value={thinking}
            onChange={e => setThinking(e.target.value)}
            placeholder="אז קודם חשבתי על... אבל אז זכרתי ש... אז הנחתי ש..."
            rows={12}
          />
          <div className={styles.phaseFooter}>
            <button type="button" className={styles.back} onClick={() => setPhase(1)}>← חזרה</button>
            <span className={styles.counter}>
              {thinkingWords} <em>מילים</em>
            </span>
            <button
              type="button"
              className={styles.next}
              onClick={() => setPhase(3)}
              disabled={!canAdvanceFrom2}
            >
              <span>השוו</span>
              <TbArrowLeft aria-hidden />
            </button>
          </div>
        </div>
      )}

      {/* PHASE 3 — the gap */}
      {phase === 3 && (
        <div className={styles.phase}>
          <h3 className={styles.phaseTitle}>הפער</h3>
          <div className={styles.compare}>
            <div className={styles.col}>
              <span className={styles.colLabel}>התוצר</span>
              <span className={styles.colNum}>{draftWords}</span>
              <span className={styles.colUnit}>מילים</span>
            </div>
            <div className={styles.colMid} aria-hidden>×</div>
            <div className={styles.col}>
              <span className={styles.colLabel}>החשיבה</span>
              <span className={[styles.colNum, styles.colNumAccent].join(' ')}>{thinkingWords}</span>
              <span className={styles.colUnit}>מילים</span>
            </div>
          </div>

          {ratio > 0 && (
            <p className={styles.ratio}>
              החשיבה שלכם הייתה <strong>פי {ratio}</strong> ארוכה מהתוצר.
              {ratio >= 4 && ' זה ממוצע — מורים מנוסים מגיעים לפי 5 ופי 6.'}
            </p>
          )}

          <aside className={styles.takeaway}>
            <p>
              <strong>מה שהתלמיד רואה</strong> — התוצר. השאלה שאתם שואלים אותו.
              ההסבר שאתם נותנים. ההחלטה שעשיתם.
            </p>
            <p>
              <strong>מה שהתלמיד לא רואה</strong> — את החשיבה שמאחורי. את 10 הרעיונות
              שדחיתם, את 3 ההנחות שעשיתם, את "כמעט-טעיתי" שלא קרה לכם. <em>מטא-קוגניציה
              היא הזמנה לתלמיד אל הצד הזה</em>.
            </p>
          </aside>

          <div className={styles.phaseFooter}>
            <button type="button" className={styles.back} onClick={() => setPhase(2)}>← חזרה</button>
          </div>
        </div>
      )}
    </section>
  );
};

export default GapExercise;